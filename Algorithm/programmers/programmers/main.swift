//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

import Foundation

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var queue = priorities.enumerated().map { ($0, $1) }  // (index, priority)
    var printOrder = 0

    while !queue.isEmpty {
        let current = queue.removeFirst()

        // 더 중요한 문서가 있으면 다시 뒤로
        if queue.contains(where: { $0.1 > current.1 }) {
            queue.append(current)
        } else {
            printOrder += 1
            if current.0 == location {
                return printOrder
            }
        }
    }

    return -1 // 도달하지 않음
}

let priorities = [2, 1, 3, 2]
let location = 2
// [2 3 0 1]
print(solution(priorities, location))

//let priorites2 = [1, 1, 9, 1, 1, 1]
//let location2 = 0
// [ 2 3 4 5 0 1]
//print(solution(priorites2, location2))

