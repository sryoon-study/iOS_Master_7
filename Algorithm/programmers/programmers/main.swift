import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var stack: [Character] = []
    var removeCnt = k
    
    for char in number {
        while removeCnt > 0, let last = stack.last, last < char {
            stack.removeLast()
            removeCnt -= 1
        }
        stack.append(char)
        print(stack, removeCnt)
    }
    return String(stack.prefix(number.count -  k))
}
 
//1111191

let number = "11111191"
let k = 3

// 3234

print(solution(number, k))
