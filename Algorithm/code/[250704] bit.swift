import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return zip(arr1, arr2).map{ num1, num2 in
        let orNum = num1 | num2
        return (0..<n).reversed().map{ i in
            (orNum & (1<<i) == 0 ? " " : "#")
        }.joined()
    }
}

let arr1 = [9, 20, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]


print(solution(5, arr1, arr2))

func debugMergedBinary(n: Int, num1: Int, num2: Int) {
    let merged = num1 | num2
    let binary = String(merged, radix: 2)
    let paddedBinary = String(repeating: "0", count: n - binary.count) + binary

    print("=== 디버깅 시작 ===")
    print("num1: \(num1) (\(String(num1, radix: 2)))")
    print("num2: \(num2) (\(String(num2, radix: 2)))")
    print("merged: \(merged) (\(paddedBinary))")
    print()

    print("순방향 (i: 0 → \(n-1)) 결과:")
    var forwardResult = ""
    for i in 0..<n {
        let bit = (merged & (1 << i)) >> i
        let symbol = bit == 1 ? "#" : " "
        print("  i=\(i): bit=\(bit) → \(symbol)")
        forwardResult.append(symbol)
    }
    print("→ forwardResult: '\(forwardResult)'")
    print()

    print("역방향 (i: \(n-1) → 0) 결과:")
    var reverseResult = ""
    for i in (0..<n).reversed() {
        let bit = (merged & (1 << i)) >> i
        let symbol = bit == 1 ? "#" : " "
        print("  i=\(i): bit=\(bit) → \(symbol)")
        reverseResult.append(symbol)
    }
    print("→ reverseResult: '\(reverseResult)'")
    print("=== 디버깅 끝 ===")
}

debugMergedBinary(n: 5, num1: 18, num2: 17)