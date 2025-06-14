//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

func solution(_ s: String) -> Bool {
    var cnt = 0
    if s.filter { $0 == "(" }.count == s.filter { $0 == ")" }.count {
        for char in s {
            if char == "(" {
                cnt += 1
            } else if char == ")" {
                cnt -= 1
            }
            if cnt < 0 {
                return false
            }
        }
    }
    return true
}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))
print(solution("(()("))


func solution2(_ s: String) -> Bool {
    var cnt = 0
    
    for char in s {
        if char == "(" {
            cnt += 1
        } else if char == ")" {
            cnt -= 1
        }
        if cnt < 0 {
            return false
        }
    }
    
    return cnt == 0
}
