# RealmService 사용 가이드 

## 1) 공통 설정

```swift
// App 시작 시 (예: SceneDelegate.makeTabBarController 직전)
let realmService = RealmService()
DIContainer.shared.register(realmService as RealmServiceType)

// 사용부 (어디서든)
let realm: RealmServiceType = DIContainer.shared.resolve()
```

> 주의: 등록 전에 `resolve()`를 호출하면 크래시 납니다. 반드시 **등록 → resolve** 순서로 사용하세요.

---

## 2) 모델별 CRUD 스니펫

> 프로젝트 기준 PK 및 스키마
>
> * **RealmAttendance**: `id: String` (PK)
> * **RealmMockInterviewGroup**: `id: String` (PK)
>
>   * **RealmMockInterviewRecord**: PK 없음 (`id: Int` + `groupId: String` 조합으로 식별)
> * **RealmUserStatus**: PK 없음(단일 레코드 정책)
> * **RealmCategory / RealmConcept / RealmQnA**: 각 `id: Int` (PK)

### A. 출석: `RealmAttendance` (PK: `id`)

```swift
// Create
let domain = Attendance(id: UUID().uuidString, date: Date(), isAttendance: true)
let obj = RealmAttendance(from: domain)
try realm.insert(obj) // PK 중복이면 RealmServiceError.duplicatePrimaryKey

// Read (예: 2025-08 한 달치)
let cal = Calendar(identifier: .gregorian)
let start = cal.date(from: DateComponents(year: 2025, month: 8, day: 1))!
let end = cal.date(byAdding: .month, value: 1, to: start)!
let p = NSPredicate(format: "date >= %@ AND date < %@", start as NSDate, end as NSDate)
let results: Results<RealmAttendance> = try realm.fetch(RealmAttendance.self, predicate: p, sorted: [])

// Update (PK로 조회 후 수정)
try realm.update(RealmAttendance.self, forPrimaryKey: domain.id) { obj in
  obj.isAttendance = false
}

// Delete (단건/일괄)
if let obj = try realm.find(RealmAttendance.self, forPrimaryKey: domain.id) {
  try realm.delete(obj)
}
try realm.deleteAll(RealmAttendance.self, predicate: p)
```

---

### B. 모의면접: `RealmMockInterviewGroup` / `RealmMockInterviewRecord`

```swift
// Create (그룹 생성)
let group = RealmMockInterviewGroup()
group.id = UUID().uuidString
group.date = Date()
try realm.insert(group) // 그룹 PK 중복 시 throw

// Read (최신순)
let groups: Results<RealmMockInterviewGroup> =
  try realm.fetch(RealmMockInterviewGroup.self,
                  predicate: nil,
                  sorted: [SortDescriptor(keyPath: "date", ascending: false)])

// Update (레코드 추가: 그룹 내부 List append, 최대 10개)
try realm.update(RealmMockInterviewGroup.self, forPrimaryKey: group.id) { g in
  guard g.records.count < 10 else { return }
  let r = RealmMockInterviewRecord()
  r.id = 0
  r.groupId = g.id
  r.question = "Q1"
  r.modelAnswer = "A1"
  r.myAnswer = "B1"
  r.isSatisfied = false
  guard g.records.contains(where: { $0.id == r.id }) == false else { return }
  g.records.append(r)
}

// Update (레코드 만족도 토글)
try realm.update(RealmMockInterviewGroup.self, forPrimaryKey: group.id) { g in
  if let rec = g.records.first(where: { $0.id == 3 }) {
    rec.isSatisfied.toggle()
  }
}

// Delete (레코드 제거 / 그룹 제거)
try realm.update(RealmMockInterviewGroup.self, forPrimaryKey: group.id) { g in
  if let idx = g.records.firstIndex(where: { $0.id == 3 }) {
    g.records.remove(at: idx)
  }
}
if let grp = try realm.find(RealmMockInterviewGroup.self, forPrimaryKey: group.id) {
  try realm.delete(grp)
}
```

---

### C. 사용자 경험치: `RealmUserStatus` (PK 없음 · 단일 레코드)

```swift
// Create (최초 1회만)
let status = RealmUserStatus()
status.exp = 0
try realm.insert(status)

// Read
let first: RealmUserStatus? = try realm.fetch(RealmUserStatus.self).first

// Update (predicate 기반 전체/단일 갱신)
try realm.updateAll(RealmUserStatus.self, predicate: NSPredicate(value: true)) { obj in
  obj.exp = 40
}
// 또는: 하나만 가져와서 write 블록에서 수정
if let st = first {
  try realm.write { _ in st.exp = 40 }
}

// Delete (전부 제거)
try realm.deleteAll(RealmUserStatus.self, predicate: nil)
```

---

### D. 학습 데이터: `RealmCategory / RealmConcept / RealmQnA` (각 `id`가 PK)

```swift
// Create (계층 관계 구성 후 카테고리 단위로 insert)
let cat = RealmCategory(); cat.id = 1; cat.category = "iOS"

let concept = RealmConcept()
concept.id = 101
concept.categoryId = 1
concept.concept = "Realm"
concept.explain = "Mobile database"
concept.latestUpdate = Date()
concept.isMemory = false

let qna = RealmQnA()
qna.id = 5001
qna.conceptId = 101
qna.question = "What is Realm?"
qna.answer = "A mobile database."
qna.latestUpdate = Date()

concept.qnas.append(qna)
cat.concepts.append(concept)

try realm.insert(cat) // 중복 PK 있으면 throw

// Read
let fetchedCat = try realm.find(RealmCategory.self, forPrimaryKey: 1)

// Update (예: Concept의 isMemory 토글)
try realm.update(RealmConcept.self, forPrimaryKey: 101) { c in
  c.isMemory.toggle()
}

// Delete (QnA 단건)
if let q = try realm.find(RealmQnA.self, forPrimaryKey: 5001) {
  try realm.delete(q)
}
```

#### ✅ 카테고리 안전 삭제 (자식까지 명시 삭제)

> Realm은 부모 삭제 시 자식이 자동 삭제되지 않습니다.
> QnA → Concept → Category 순으로 **명시 삭제**하세요.

```swift
if let cat = try realm.find(RealmCategory.self, forPrimaryKey: 1) {
  try realm.write { r in
    // 1) 모든 QnA 수집 후 삭제
    let allQnAs: [RealmQnA] = cat.concepts.flatMap { Array($0.qnas) }
    r.delete(allQnAs)
    // 2) Concept 삭제
    r.delete(cat.concepts)
    // 3) Category 삭제
    r.delete(cat)
  }
}
```

---

## 3) 예외/에러 처리 규약

* **중복 PK 삽입**: `RealmServiceError.duplicatePrimaryKey`
* **PK 누락**: `RealmServiceError.missingPrimaryKeyValue`
* **업데이트/일괄 업데이트 대상 없음**: `RealmServiceError.objectNotFound`

```swift
do {
  try realm.insert(obj)
} catch RealmServiceError.duplicatePrimaryKey {
  // TODO: 사용자 피드백 등
} catch {
  // TODO: 공통 에러 처리
}
```

---

## 4) 팁

* 테스트/샌드박스에서는 `Realm.Configuration(inMemoryIdentifier: ...)`로 **인메모리 Realm**을 쓰면 테스트 간 간섭이 없습니다.
* `updateAll`은 \*\*predicate 결과가 비어 있으면 `objectNotFound`\*\*를 던지므로, 호출부에서 의도에 맞게 처리하세요.
* PK가 없는 모델(예: `RealmUserStatus`)은 **정책을 명확히**: 단일 행만 허용 등의 규칙을 문서화하고, API 사용도 그 전제에 맞춰주세요.

---
