/*
문제 링크 : https://school.programmers.co.kr/learn/courses/30/lessons/42748
*/

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    commands.map { (command) -> Int in
        Array(array[(command[0] - 1)..<command[1]]).sorted()[command[2] - 1]
    }
}

let array = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

print(solution(array, commands))


func solution2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    commands.map { command in
        let (i, j, k) = (command[0], command[1], command[2])
        return array[(i - 1)..<j].sorted()[k - 1]
    }
}
