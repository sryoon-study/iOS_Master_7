//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    let answer = citations.sorted(by: >)
        .enumerated()
        .filter { $0.element >= $0.offset + 1 }
        .map { $0.offset + 1 }
        .max() ?? 0
    print(answer)
    return -1
}


print(solution([3, 0, 6, 1, 5, 4]))

//  n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값

// 6 5 3 1 0
// 1 2 3 4 5  -> 3

// 6 5 4 3 1 0
// 1 2 3 4 5 6  -> 3


// 6 5 4 4 3 1
// 1 2 3 4 5 6
