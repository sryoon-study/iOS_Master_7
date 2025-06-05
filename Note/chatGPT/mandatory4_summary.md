
# 📘 필수 과제 4 - Introducible 프로토콜 및 다형성 구현

## ✅ 과제 목표

- 다양한 타입(`Robot`, `Cat`, `Dog`)에 공통된 인터페이스(`Introducible`)를 정의하고,
- 각 타입의 고유 동작과 함께 프로토콜 기반 다형성(polymorphism)을 구현한다.

---

## 1. `Introducible` 프로토콜 정의

```swift
protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}
```

- `name`: 읽기/쓰기 가능한 문자열 프로퍼티
- `introduce()`: 자기소개 문자열 반환 메서드

---

## 2. 각 타입 정의 및 프로토콜 채택

### 🦾 Robot (class)

```swift
class Robot: Introducible {
    var name: String {
        didSet {
            if name != oldValue {
                print("name 변경 알림\n변경 이전 값 : \(oldValue)\n변경 이후 값 : \(name)")
            }
        }
    }
    var batteryLevel = 100

    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }

    func batteryCharge(charge: Int) -> String {
        if batteryLevel + charge >= 100 {
            batteryLevel = 100
            return "배터리가 완전 충전되었습니다."
        } else {
            batteryLevel += charge
            return "배터리 잔량은 \(batteryLevel)%입니다."
        }
    }

    init(name: String) {
        self.name = name
    }
}
```

### 🐱 Cat (struct)

```swift
struct Cat: Introducible {
    var name: String
    var isSleep = false

    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }

    mutating func fallAsleep() -> String {
        if isSleep == false {
            isSleep = true
            return "고양이가 잠듭니다."
        } else {
            return "이미 잠들어 있습니다"
        }
    }

    mutating func awake() -> String {
        if isSleep == true {
            isSleep = false
            return "고양이가 깨어납니다"
        } else {
            return "이미 깨어있습니다."
        }
    }

    init(name: String) {
        self.name = name
    }
}
```

### 🐶 Dog (struct)

```swift
struct Dog: Introducible {
    var name: String

    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }

    func bark() -> String {
        return "멍멍"
    }

    init(name: String) {
        self.name = name
    }
}
```

---

## 3. [Introducible] 배열 정의 및 고유 메서드 호출

```swift
let robotEva = Robot(name: "에반게리온")
let catNorway = Cat(name: "노르웨이숲")
let dogSiba = Dog(name: "시바견")

var arr: [Introducible] = [robotEva, catNorway, dogSiba]

for item in arr {
    if let robot = item as? Robot {
        print(robot.introduce())
        print(robot.batteryCharge(charge: 20))
    } else if var cat = item as? Cat {
        print(cat.introduce())
        print(cat.fallAsleep())
        print(cat.awake())
    } else if let dog = item as? Dog {
        print(dog.introduce())
        print(dog.bark())
    }
}
```

- 배열은 프로토콜 타입 `[Introducible]` 로 선언
- 순회하면서 `as?`로 타입 확인 후 각 타입 고유 메서드 호출
- `Cat`은 값 타입이므로, 내부 상태 변경은 복사본에 한정됨

---

## 🧠 학습 포인트 요약

| 개념 | 설명 |
|------|------|
| `protocol` | 여러 타입에 공통 기능을 강제함 |
| `class vs struct` | 참조 타입과 값 타입의 차이, `mutating` 키워드 필요 여부 |
| `didSet` 옵저버 | 속성 변경 시 후처리 가능 (`oldValue` 사용) |
| 다형성 | `[Introducible]` 배열을 통해 다양한 타입을 한 번에 관리 |
| 타입 캐스팅 | `as?`, `is` 를 이용해 런타임 타입 검사 및 다운캐스팅 |
| 옵셔널 처리 | 안전한 호출을 위해 `?` 및 `??` 연산자 활용 |

---

## ✅ 과제 완료 상태

- [x] Introducible 프로토콜 정의
- [x] Robot, Cat, Dog 타입 정의 및 고유 기능 추가
- [x] Robot의 name 변경 감지 로직 구현
- [x] [Introducible] 배열에 인스턴스 추가
- [x] 배열 순회하며 고유 메서드 호출

🎉 과제 4 완료!
