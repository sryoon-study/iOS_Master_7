import Foundation

func solution(_ x:Int) -> Bool {
    let digits = String(x).compactMap { $0.wholeNumberValue }
    let sum = digits.reduce(0, +)
    return x%sum == 0
}

solution(10)
