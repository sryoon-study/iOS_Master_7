/*
문제 사이트 : https://school.programmers.co.kr/learn/courses/30/lessons/42840#
*/
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    // 수포자들의 패턴 기록
    let pattern = [
        [1, 2, 3, 4, 5], 
        [2, 1, 2, 3, 2, 4, 2, 5], 
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]

    // 결과를 수납할 배열 선언
    var result: [Int] = []

    pattern.forEach {
        // 정답 카운트
        var matchCount = 0
        
        // 정답의 길이가 패턴의 길이를 초과할 때
        if $0.count < answers.count {
            
            // 패턴을 곱해줄 (정답의 길이 / 패턴의 길이)의 올림 정수를 획득
            let multiple = Int(ceil(Double(answers.count) / Double($0.count)))
            
            // 패턴 배열을 반복해서 정답보다 길게 만듬
            // flatMap으로 1차원배열로 다시 바꿔주는 작업이 필요
            let arr = Array(repeating: $0, count: multiple).flatMap { $0 }

            // 패턴과 정답이 일치하는 갯수 세기
            // zip은 길이가 짧은 쪽에 맞춰 주기 때문에 별다른 가공 필요 없음
            matchCount = zip(answers, arr).filter { $0 == $1 }.count
            result.append(matchCount)
            
        } else { // 정답의 길이가 패턴의 길이와 같거나 적을 때

            //정답 숫자 체크
            matchCount = zip(answers, $0).filter { $0 == $1 }.count
            result.append(matchCount)
        }
        
    }
    // swift의 filter는 동률처리도 자연스럽게 해줘서 별다른 가공 필요X
    // enumerate로 인덱스 번호 취득한 후 map으로 배열화 시켜서 리턴
    return result.enumerated()
        .filter {$0.element == result.max()} 
        .map {$0.offset + 1}
}



let answers1 = [1,2,3,4,5]
let answers2 = [1,3,2,4,2]

print(solution(answers1))
print(solution(answers2))
print(solution([]))

// gpt 개선 코드
import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let patterns = [
        [1, 2, 3, 4, 5],
        [2, 1, 2, 3, 2, 4, 2, 5],
        [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    
    let scores = patterns.map { pattern -> Int in
        let repeated = Array(repeating: pattern, count: (answers.count + pattern.count - 1) / pattern.count)
            .flatMap { $0 }
        return zip(answers, repeated).filter { $0 == $1 }.count
    }

    let maxScore = scores.max()
    return scores.enumerated()
        .filter { $0.element == maxScore }
        .map { $0.offset + 1 }
}
