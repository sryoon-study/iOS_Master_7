
# 📘 iOS 도전 과제: 자동차 클래스 설계 및 실행

## ✅ 과제 개요

- 자동차(Car)를 중심으로 상속과 엔진 교체 기능을 활용한 객체지향 설계
- `Car` → `ElectricCar`, `HybridCar`로 확장
- Swift 프로토콜, 접근 제어, 실행 흐름 분리 등 학습

---

## 🧱 클래스/프로토콜 설계 구조

### 🔹 `Engine` (Protocol)

```swift
protocol Engine {
    var engineName: String { get }
}
```

- 실제 엔진 타입: `ElectricEngine`, `HybridEngine`, `GasolineEngine`
- 각 엔진은 `engineName`만 제공하는 단순한 구조

---

### 🔹 `Car` (Base Class)

```swift
class Car {
    public let brand: String
    public let modelName: String
    public let modelYear: String
    private(set) var engine: Engine
    private(set) var status: CarStatus

    func drive()
    func stop()
}
```

- 공통 속성은 `brand`, `modelName`, `modelYear`, `engine`, `status`
- `drive()` 및 `stop()` 메서드 포함
- `engine`은 외부에서 변경 불가 (`private(set)`)

---

### 🔹 `ElectricCar`: 전기차 서브클래스

```swift
class ElectricCar: Car {
    init(...) // 내부에서 ElectricEngine 강제 적용
    func charge()
}
```

- `ElectricEngine`을 자동 주입하는 생성자 사용
- 전기차 전용 기능인 `charge()` 추가 가능

---

### 🔹 `HybridCar`: 하이브리드카 서브클래스

```swift
class HybridCar: Car {
    func switchEngine(to: Engine)
}
```

- 생성자에서 `HybridEngine()` 기본 탑재
- `switchEngine(to:)` 메서드로 런타임에 엔진 교체 가능
- 교체 시 출력 메시지 포함

---

## 🎯 실행 흐름

- `main6()`에서 테스트 인스턴스를 직접 생성하고 동작 실행:

```swift
let testCar = HybridCar(brand: ..., modelName: ..., modelYear: ...)
testCar.drive()
testCar.switchEngine(to: ElectricEngine())
testCar.switchEngine(to: HybridEngine())
testCar.stop()
```

---

## 📦 폴더 및 파일 구조

```
Week2Assignment/
└─ Challange1/
   ├─ Car.swift
   ├─ CarStatus.swift
   ├─ Engine.swift
   ├─ ElectricCar.swift
   ├─ HybridCar.swift
   ├─ Message.swift
   ├─ Challenge1Main.swift
   └─ main.swift
```

- `Message.swift`: 출력 메시지 통합 관리
- `CarStatus.swift`: 차량 상태를 표현하는 enum 분리

---

## 🔐 접근 제어 정리

| 프로퍼티/메서드 | 접근제어자 | 이유 |
|------------------|-------------|------|
| `brand`, `modelName` | `public let` | 외부에서 읽기만 가능 |
| `engine` | `private(set)` | 외부에서 직접 변경 금지 |
| `status` | `private(set)` | 상태 변경은 내부에서만 |
| `drive()`, `stop()` | `public` | 외부 호출 가능 |

---

## 🧠 주요 학습 포인트

- ✅ 상속을 통해 기본 기능 재사용 (`Car` → `HybridCar`)
- ✅ 프로토콜로 엔진 추상화 (`Engine`)
- ✅ `private(set)`으로 캡슐화와 외부 접근 통제
- ✅ `switchEngine(to:)`에서 런타임 동작 확장
- ✅ 실행 흐름 분리 (`main.swift` → `taskMap` + `main6()`)

---

## 🔄 보완 가능성 & 회고

- `HybridCar`는 유연하지만, 타입 안전성을 위해 `Engine` 타입 제한 고민 여지 있음
- 프로토콜 기반 확장과 상속 기반 설계의 장단점 비교 경험
- 실행 entry point(`main.swift`)와 분할된 테스트 흐름 관리 경험

---
