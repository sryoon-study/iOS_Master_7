import Foundation

func solution(_ numbers:[Int]) -> String {
    var result = numbers.map { String($0) }
    result.sort { String(repeating: $0, count: 3) > String(repeating: $1, count: 3) }
    
    let answer = result.joined()
    return answer.hasPrefix("0") ? "0" : answer
}

let numbers = [3, 30, 34, 5, 9]
print(solution(numbers))

//https://school.programmers.co.kr/learn/courses/30/lessons/42746