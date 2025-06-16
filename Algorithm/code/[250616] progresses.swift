/*
문제 페이지 : https://school.programmers.co.kr/learn/courses/30/lessons/42586
*/

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result:[Int] = []
    var unit = zip(progresses, speeds).map{ $0 }
    
    while(unit.count > 0){
        let days = Int(ceil(Double((100 - unit[0].0)) / Double(unit[0].1)))
        let newProgress = unit.map{$0.0 + $0.1 * days }
        var cnt = 0
        print(newProgress)
        for i in newProgress{
            if i < 100{
                break
            }
            cnt+=1
        }
        if cnt > 0 {
            unit.removeFirst(cnt)
            result.append(cnt)
        }
    }
    
    return result
}


let progresses = [95, 90, 99, 99, 80, 99]
let speeds = [1, 1, 1, 1, 1, 1]


print(solution(progresses, speeds))

func solution2(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var result: [Int] = []
    var tasks = Array(zip(progresses, speeds))
    
    while let current = tasks.first {
        let days = Int(ceil(Double(100 - current.0) / Double(current.1)))
        let updated = tasks.map { $0.0 + $0.1 * days }
        
        let completedCount = updated.prefix(while: { $0 >= 100 }).count
        if completedCount > 0 {
            tasks.removeFirst(completedCount)
            result.append(completedCount)
        }
    }
    
    return result
}