
# 📦 도전문제 2 - SortableBox 제네릭 구조체

## ✅ 문제 요약

- `SortableBox`라는 이름의 **제네릭 구조체**를 정의한다.
- 타입 파라미터는 1개, `T`로 지정.
- `items: [T]`라는 프로퍼티를 가진다.
- 단, `T: Comparable`일 때에만 `sortItems()` 메서드를 사용할 수 있어야 하며,
  이 메서드는 `items`를 오름차순으로 정렬하고 그 결과를 내부에 반영해야 한다.
- `T`가 Comparable을 따르지 않으면, 해당 메서드 사용 시 컴파일 오류가 발생해야 한다.

---

## ✅ 구현 요약

### 제네릭 구조체 선언

```swift
struct SortableBox<T> {
    var items: [T]
}
```

### `T: Comparable`일 때만 동작하는 메서드

```swift
extension SortableBox where T: Comparable {
    mutating func sortItems() {
        items.sort()
    }
}
```

- `mutating`: `items`는 구조체의 내부 상태를 바꾸므로 필요
- `where T: Comparable`: `T`가 비교 가능할 때만 이 메서드를 활성화

---

## ✅ 테스트 코드 예시

### 정상 작동 (Comparable 타입 사용 시)

```swift
var box1 = SortableBox(items: [3, 1, 2])
box1.sortItems()  // ✅ 정상 작동

var box2 = SortableBox(items: ["e", "a", "i", "o", "u"])
box2.sortItems()  // ✅ 정상 작동
```

### 에러 발생 (Comparable을 따르지 않는 타입)

```swift
var box3 = SortableBox(items: [[1], [2]])
box3.sortItems() // ❌ 컴파일 에러 발생 (T = [Int]는 Comparable을 따르지 않음)
```

---

## ✅ 학습 포인트

| 항목 | 내용 |
|------|------|
| `where`절 | 메서드에 타입 제약을 걸 때 사용 |
| `mutating` | 구조체 내부 값을 바꾸는 메서드에 필요 |
| `T: Comparable` | 비교 가능한 타입일 때만 sort 허용 |
| `sorted()` vs `sort()` | `sorted()`는 정렬된 새 배열 반환, `sort()`는 원본 배열 정렬 (in-place) |
| 타입 제약 검증 | `[Int]`는 `Comparable`이 아니므로 제약 테스트에 적합 |

---

## ✅ 결론

- Swift의 제네릭 타입과 조건부 메서드 구현을 학습할 수 있는 과제
- 타입 안정성과 컴파일 타임 검사를 활용한 견고한 설계 가능
- `Comparable`의 활용성과 Swift 표준 라이브러리 동작을 깊이 이해하게 됨
