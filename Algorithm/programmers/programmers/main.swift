//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//


import Foundation


func solution(_ answers:[Int]) -> [Int] {
    let pattern = [
        [1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    ]
    var result: [Int] = []
    pattern.forEach {
        
        var matchCount = 0
        
        if $0.count < answers.count {
            
            let multiple = Int(ceil(Double(answers.count) / Double($0.count)))
            let arr = Array(repeating: $0, count: multiple).flatMap { $0 }
            matchCount = zip(answers, arr).filter { $0 == $1 }.count
            result.append(matchCount)
            
        } else {
            matchCount = zip(answers, $0).filter { $0 == $1 }.count
            result.append(matchCount)
        }
        
    }
    return result.enumerated()
        .filter {$0.element == result.max()}
        .map {$0.offset + 1}
}



let answers1 = [1,2,3,4,5]
let answers2 = [1,3,2,4,2]

print(solution(answers1))
print(solution(answers2))
print(solution([]))


