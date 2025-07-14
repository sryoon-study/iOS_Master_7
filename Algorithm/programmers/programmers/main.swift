import Foundation

//func solution(_ n:Int) -> Int {
//    let fibo = fibo(n)
//    return fibo % 1234567
//}

func solution(_ n:Int) -> Int {
    var a = 0
    var b = 1
    for _ in 2...n {
        // 미리 나머지를 구하지 않으면 Int32를 초과해서 오버플로우로 런타임 에러
        // 피보나치 수열이 아닌 (피보나치 수열의 나머지) 수열로 만들어서 오버플로우 회피
        let tmp = (a + b) % 1234567
        a = b
        b = tmp
    }
    return b
}


//    실패 (signal: illegal instruction (core dumped))?
// 0 1 1 2 3 5 8 13 21 34 55
// %3 이라면
// 1 1 2 0 2 2 1 0 1 1
//print(fibo(5))
//print(fibo(8))
//print(fibo(10))


//n은 2 이상 100,000 이하인 자연수입니다.


//
//func solution(_ friends:[String], _ gifts:[String]) -> Int {
//
//    // { 선물 준사람 : { 선물 받은사람 : 갯수} }
//    var giftDict: [String: [String: Int]] = [:]
//    // {선물 받은사람 : 갯수 }
//    var giftIndex: [String: Int] = [:]
//
//    for gift in gifts {
//        let split = gift.split(separator: " ")
//        let from = String(split[0]) // 준 사람
//        let to = String(split[1]) // 받은사람
//
//        // [준사람 : [받은사람: 횟수]]
//        giftDict[from, default: [:]][to, default: 0] += 1
//        giftIndex[from, default: 0] += 1
//        giftIndex[to, default: 0] -= 1
//    }
//    /*
//     [
//     "muzi": ["frodo": 2],
//     "ryan": ["muzi": 3],
//     "neo": ["muzi": 1],
//     "frodo": ["ryan": 1, "muzi": 1]
//     ]
//     */
//
//    // 다음달에 받을 [사람 : 갯수]
//    var nextGiftCount: [String: Int] = [:]
//
//    /*
//     muzi -> ryan frodo neo
//     ryan -> frodo neo
//     frodo -> neo
//    */
//    for (index, friend) in friends.enumerated() {
//        for offset in (index + 1) ..< friends.count {
//
//            let target = friends[offset] // friend와 비교할 대상
//            let putCount = giftDict[friend]?[target] ?? 0
//            let getCount = giftDict[target]?[friend] ?? 0
//
//            if putCount > getCount { //friend가 준게 더 많으면
//                nextGiftCount[friend, default: 0] += 1 //준사람 +1
//            } else if putCount < getCount {
//                nextGiftCount[target, default: 0] += 1 //받은 사람 + 1
//            } else { // 같다면
//                let friendCount = giftIndex[friend] ?? 0
//                let targetCount = giftIndex[target] ?? 0
//                if friendCount > targetCount {
//                    nextGiftCount[friend, default: 0] += 1
//                } else if friendCount < targetCount {
//                    nextGiftCount[target, default: 0] += 1
//                }
//            }
//        }
//    }
//
//    return nextGiftCount.values.max() ?? 0
//}
//
//
//let friends = ["muzi", "ryan", "frodo", "neo"]
//let gifts = ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]
//
//print(solution(friends, gifts))
