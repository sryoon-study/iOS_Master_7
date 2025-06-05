# 📚 Swift: `Strideable` & `Numeric` 프로토콜 정리

Swift의 프로토콜 제약을 활용하면 함수와 타입을 더욱 유연하고 안전하게 구성할 수 있습니다. `Numeric`과 `Strideable`은 수치 연산 및 간격 계산을 할 수 있는 타입을 다룰 때 핵심적으로 사용됩니다.

---

## ✅ 1. `Numeric` 프로토콜

- **역할**: 덧셈, 뺄셈, 곱셈 등 기본 수치 연산이 가능한 타입을 제한할 때 사용
- **채택 타입**: `Int`, `Float`, `Double`, `Decimal` 등

### 예시
```swift
func add<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}
```

---

## ✅ 2. `Strideable` 프로토콜

- **역할**: 값 간의 거리(`distance(to:)`) 계산, 다음 값 계산(`advanced(by:)`)이 가능한 타입
- **채택 타입**: `Int`, `Double`, `Date` 등

### 예시
```swift
let start = 1
let end = 5
let distance = start.distance(to: end) // 4
```

---

## ✅ 3. `isMultiple(of:)` 메서드

- **정수형 타입 (`BinaryInteger`)** 에서 사용 가능
- **특정 수의 배수인지**를 가독성 좋게 확인

### 예시
```swift
let x = 10
x.isMultiple(of: 2) // true
```

---

## ✅ 4. 제네릭 함수에서 `Strideable & Numeric` 활용 예시

### 짝수 인덱스 요소 필터링 (고급 버전)
```swift
func filterEvenIndexElements<
    T,
    I: BinaryInteger
>(
    _ arr: [T],
    indexType: I.Type = I.self
) -> [T] {
    arr.enumerated()
        .filter { I($0.offset).isMultiple(of: 2) }
        .map { $0.element }
}
```

- `T`: 요소 타입 (제한 없음)
- `I`: 인덱스 타입 (Int, UInt 등 정수형 타입 지원)

---

### 요소를 일정 간격으로 순회하며 합산
```swift
func sumEveryN<T: Numeric & Strideable>(in array: [T], step: T.Stride) -> T {
    stride(from: 0, to: array.count, by: step)
        .map { array[$0] }
        .reduce(0, +)
}
```

---

## 🧾 요약 표

| 프로토콜 | 기능 | 사용 예 |
|----------|------|---------|
| `Numeric` | 덧셈, 곱셈, 뺄셈 등 수학 연산 | 합계 구하기 |
| `Strideable` | 거리 및 간격 계산 | 반복 간격 처리 |
| `isMultiple(of:)` | 배수 판정 | 짝수 인덱스 필터링 |

---

## 🏁 마무리

이 두 프로토콜을 함께 사용하면, 수치형 데이터를 더 안전하고 유연하게 처리할 수 있습니다. 고급 제네릭 함수 구현이나 반복, 간격 처리 로직에 자주 활용되며, Swift다운 코드를 구성하는 데에 핵심적인 요소입니다.
