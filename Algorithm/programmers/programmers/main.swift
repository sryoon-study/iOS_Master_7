import Foundation

func solution(_ numbers: [Int], _ target: Int) -> Int {
    var cnt = 0

    func dfs(i: Int, currentSum: Int) {
        if i == numbers.count { // numbers까지 오면 탐색 종료
            if currentSum == target { // 합계가 타겟넘버면 +1
                cnt += 1
            }
            return
        }

        dfs(i: i + 1, currentSum: currentSum + numbers[i]) // + 할 경우 재귀호출
        dfs(i: i + 1, currentSum: currentSum - numbers[i]) // - 할 경우 재귀호출
    }

    dfs(i: 0, currentSum: 0) // 0,0으로 시작
    return cnt
}

let numbers = [1, 1, 1, 1, 1]
let target = 3

let numbers2 = [4, 1, 2, 1]
let target2 = 4

print(solution(numbers, target))
print(solution(numbers2, target2))

func solution2(_ numbers: [Int], _ target: Int) -> Int {
    numbers
        .reduce([0]) { results, number in
            results.flatMap { [$0 + number, $0 - number] }
        }
        .filter { $0 == target }
        .count
}
