
import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result: [[Int]] = []
    
    // 세로행을 가로처럼 변형
    let newArr2 = (0..<arr2[0].count).map { index in
        arr2.map { $0[index]}
    }
    
    // 이 이후 잘못됨
    let flat = arr1.flatMap { $0 }
    
    for i in flat {
        var tmp: [Int] = []
        for item in newArr2 {
            let sum = item.reduce(0, +) * i
            tmp.append(sum)
        }
        result.append(tmp)
    }
    return result
}



let arr1 = [[2, 3, 2], [4, 2, 4], [3, 1, 4]]
let arr2 = [[5, 4, 3], [2, 4, 1], [3, 1, 1]]

print(solution(arr1, arr2))
