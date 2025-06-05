import Foundation

func solution(_ my_string:String) -> String {
    guard my_string.count >= 1 && my_string.count <= 110 else {
        return  "길이가 1이상 110이하의 문자열을 넣어주세요"
    }
    
    var result = ""
    var chkSet = Set<Character>()
    
    for char in my_string{
        if !chkSet.contains(char) {
            chkSet.insert(char)
            result+=String(char)
        }
    } 
        
    return result
}

let str = "We are the world"
let result = solution(str)

print(result)

/*
https://school.programmers.co.kr/learn/courses/30/lessons/120888
*/