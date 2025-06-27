//
//  main.swift
//  programmers
//  https://school.programmers.co.kr/learn/courses/30/lessons/12951
//  Created by Yoon on 6/5/25.
//

import Foundation

// 최초 풀ㅣ
func solution(_ s:String) -> String {
    var isToUpper = true
    var result = ""
    for char in s {
        if isToUpper {
            result.append(char.uppercased())
            isToUpper = false
        } else {
            result.append(char.lowercased())
        }
        if char == " " {
            isToUpper = true
        }
    }
    return result
}

let s = "3people unFollowed me"
print(solution(s))

// 개선 포인트 반영

func solution(_ s:String) -> String {
    var isToUpper = true
    var result = ""
    for char in s {
        if char == " " {
            result.append(" ")
            isToUpper = true
        } else {
            // char에는 upper lower가 없어서 String(char).uppercased()로 자동변환되지만 명시적으로 사용
            result.append(isToUpper ? String(char).uppercased() : String(char).lowercased())
            isToUpper = false
        }
    }

}
// 함수형 사용법
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

/*
reduce(into:)를 사용하여 바로 리턴
*/