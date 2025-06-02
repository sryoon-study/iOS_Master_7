이번에는 **실제 iOS 개발에서 자주 사용되는 3가지 상황**을 예제로 보여드리고,
각 상황에서 **왜 클로저 캡처가 필요한지**, 그리고 **`weak` 또는 `unowned`를 왜 써야 하는지**까지 꼼꼼하게 설명드리겠습니다.

---

## 🧩 예제 1. ✅ 네트워크 요청에서 클로저로 결과 받기

```swift
class UserViewController: UIViewController {
    var username: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData { [weak self] result in
            guard let self = self else { return }
            self.username = result
            print("사용자 이름: \(self.username)")
        }
    }

    func fetchUserData(completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion("Brody")
        }
    }
}
```

### 🔍 왜 클로저 캡처가 필요할까?

* `fetchUserData`는 비동기로 작동합니다.
* `completion` 클로저는 `viewDidLoad()`가 끝난 뒤 **1초 후에 실행됩니다**.
* 클로저 안에서 `self.username`에 접근해야 하므로, **`self`를 캡처해야 합니다**.
* 만약 `UserViewController`가 그 사이에 해제되었다면? → `self`는 nil이 될 수 있음 → 그래서 `weak self` 사용.

➡️ **비동기 클로저 안에서 외부 객체(self)를 안전하게 참조하기 위해 클로저 캡처가 필요**합니다.

---

## 🧩 예제 2. ✅ `Timer` 안에서 반복 작업

```swift
class Counter {
    var value = 0
    var timer: Timer?

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.value += 1
            print("현재 카운트: \(self?.value ?? 0)")
        }
    }

    deinit {
        print("Counter 해제됨")
        timer?.invalidate()
    }
}
```

### 🔍 왜 클로저 캡처가 필요할까?

* `Timer`는 내부에서 클로저를 유지합니다.
* `self`를 **strong으로 캡처하면 Timer → self → Timer ... 순환 참조 발생**.
* 그래서 `[weak self]`로 캡처해야, `Counter` 인스턴스가 해제될 수 있습니다.

➡️ **클로저가 외부 객체를 강하게 잡으면 메모리 해제가 안 되기 때문에, `weak` 캡처가 반드시 필요**합니다.

---

## 🧩 예제 3. ✅ 버튼 액션 내부에서 상태 저장 (내부 값 유지)

```swift
class ButtonHandler {
    func makeActionCounter() -> () -> Void {
        var count = 0
        return {
            count += 1
            print("버튼이 \(count)번 눌렸습니다.")
        }
    }
}

let handler = ButtonHandler()
let action = handler.makeActionCounter()

action()  // 버튼이 1번 눌렸습니다.
action()  // 버튼이 2번 눌렸습니다.
```

### 🔍 왜 클로저 캡처가 필요할까?

* 클로저 안에서 `count`를 사용하고 있는데, 이 변수는 이미 함수 `makeActionCounter()`의 범위를 벗어났습니다.
* 그런데도 계속 값을 기억하고 있습니다.
  ➡️ 이게 바로 **값을 클로저가 캡처(capture)** 했기 때문입니다.

➡️ 이런 구조 덕분에 Swift에서는 외부 변수를 별도로 선언하지 않고도, **상태를 가진 함수를 자연스럽게 만들 수 있습니다.**

---

## ✅ 요약: 언제 클로저 캡처가 필요할까?

| 상황                     | 이유                              | 캡처 전략                           |
| ---------------------- | ------------------------------- | ------------------------------- |
| 비동기 작업에서 외부 객체 접근      | 작업 완료 후에도 외부 객체(`self`)에 접근해야 함 | `[weak self]`, `[unowned self]` |
| 타이머, 애니메이션 등에서 클로저 보관  | 클로저가 객체를 강하게 참조 → 메모리 누수 위험     | `[weak self]`                   |
| 클로저가 외부 변수 값을 기억해야 할 때 | 함수 외 변수 생명주기를 넘어서 값 유지          | `[변수명]` (값 타입일 땐 복사)            |

---

## 🧠 마무리 한 줄 정리

> 클로저는 코드와 함께 **그 시점의 변수 상태를 "묶어서" 기억할 수 있는 도구**이고,
> Swift는 이를 통해 **함수형 프로그래밍, 비동기 처리, 메모리 안전성**을 동시에 챙깁니다.

---

이어서 실제 iOS 앱 아키텍처 (예: MVVM에서 ViewModel → View 바인딩)에 클로저가 어떻게 활용되는지도 보여드릴 수 있어요.
혹시 더 보고 싶은 방향 있으실까요?
