//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var allRoute: [[[Int]]] = []
    permuteWirth(dungeons, dungeons.count-1, result: &allRoute)
    var maxCount: Int = 0
    
    for routes in allRoute {
        var hp = k
        var count = 0
        for route in routes {
            if hp >= route[0] {
                count += 1
                hp -= route[1]
            } else {
                break
            }
        }
        if maxCount < count {
            maxCount = count
        }
    }
    return maxCount
}


func permuteWirth<T>(_ a: [T], _ n: Int, result: inout [[T]]) {
    if n == 0 {
        result.append(a)
    } else {
        var a = a
        permuteWirth(a, n - 1, result: &result)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1, result: &result)
            a.swapAt(i, n)
        }
    }
}


let k = 80
var dungeons = [[80,20],[50,40],[30,10]]

print(solution(k, dungeons))


