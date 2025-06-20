/*
문제 https://school.programmers.co.kr/learn/courses/30/lessons/42842
*/

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    
    for h in 3...total {
        if total % h == 0 {
            let w = total / h
            if w >= h {
                if (w - 2 ) * (h - 2) == yellow {
                    return [w, h]
                }
            }
        }
    }
    
    return []
}


//gpt 리팩토링

func solution(_ brown: Int, _ yellow: Int) -> [Int] {
    let total = brown + yellow

    for h in 3...Int(sqrt(Double(total))) {
        if total % h == 0 {
            let w = total / h
            if (w - 2) * (h - 2) == yellow {
                return [w, h]
            }
        }
    }

    return []
}

/*
✅ 1. 반복 범위 최적화: √total까지만 보면 되는 이유
어떤 수 total의 약수 쌍은 다음처럼 항상 대칭입니다.

예: total = 48
→ 약수쌍: (1, 48), (2, 24), (3, 16), (4, 12), (6, 8), (8, 6), …

따라서 h = 3...√total까지만 탐색하면 w는 자동으로 계산되고,
w ≥ h인 조합도 자동으로 걸러지게 됩니다.

👉 이로 인해 불필요한 절반의 반복을 제거하게 됩니다.
➡️ 시간 복잡도 향상 (O(n) → O(√n))
*/