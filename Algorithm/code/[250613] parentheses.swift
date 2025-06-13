/*
문제 페이지 : https://school.programmers.co.kr/learn/courses/30/lessons/12909
*/

import Foundation

//최초 풀ㅣ
func solution(_ s: String) -> Bool {

    var cnt = 0
    // 괄호 짝이 안맞으면 false
    if s.filter { $0 == "(" }.count == s.filter { $0 == ")" }.count {

        for char in s {
            if char == "(" {
                cnt += 1
            } else if char == ")" {
                cnt -= 1
            }
            // ")"가 더 많아지면 false
            if cnt < 0 {
                return false
            }
        }
    }
    return true
}

//효율성 개선 (위도 프로그래머스 효율성은 통과하긴 함)
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
    //filter 대신 마지막에 짝이 안맞아서 "("가 남으면 false 리턴
    return cnt == 0
}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))
print(solution("(()("))
