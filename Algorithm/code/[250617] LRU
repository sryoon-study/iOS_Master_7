/*
문제 페이지 : https://school.programmers.co.kr/learn/courses/30/lessons/17680
*/
import Foundation


func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    var time = 0
    var cache: [String] = []
    
    for city in cities {
        let lowerCasedCity = city.lowercased()
        if let index = cache.firstIndex(of: lowerCasedCity) {
            //cash hit
            time += 1
            cache.remove(at: index)
        } else {
            //cash miss
            time += 5
            
            // 방어 코딩 논리적으로는 ==여도 문제 없음
            if cache.count >= cacheSize {
                // 카카오 18년 공채문제는 캐쉬사이즈 0이 테스트케이스에 있음 예외처리 필요
                if cacheSize > 0 {
                    cache.removeFirst()
                }
            }
        }
        // 카카오 18년 공채문제는 캐쉬사이즈 0이 테스트케이스에 있음 예외처리 필요
        if cacheSize > 0 {
            cache.append(lowerCasedCity)
        }
    }
    
    return time
}

let cities1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
let cities2 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]

let cashSize1 = 3
let cashSize2 = 2

print(solution(cashSize1, cities1))
print(solution(cashSize2, cities2))