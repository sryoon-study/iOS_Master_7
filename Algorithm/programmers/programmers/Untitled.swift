import Foundation

//
// func solution(_ friends:[String], _ gifts:[String]) -> Int {
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
// }
//
//
// let friends = ["muzi", "ryan", "frodo", "neo"]
// let gifts = ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]
//
// print(solution(friends, gifts))
