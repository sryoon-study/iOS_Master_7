//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

func solution(_ s: String) -> String {
    var isToUpper = true
    return s.reduce(into: "") { result, char in
        if char == " " {
            result.append(" ")
            isToUpper = true
        } else {
            result.append(isToUpper ? String(char).uppercased() : String(char).lowercased())
            isToUpper = false
        }
    }
}

let s = "3people unFollowed me"
print(solution(s))



