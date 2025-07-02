
import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var inderdict: [String: Int]
    var dict: [String: [String: Int]]
    
    let splitGift = gifts.map { $0.split(separator: " ") }
    
    // 여기서부터 막힘
    let tmp = friends.map { name in splitGift.map { $0[0] == name ? $0[1] : "" } }
    print(tmp)
    return 0
    
}

let friends = ["muzi", "ryan", "frodo", "neo"]
let gifts = ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]

//let tmp = "muzi frodo"
//print(tmp.split(separator: " "))


print(solution(friends, gifts))


/*
 gifts의 원소는 "A B"형태의 문자열입니다. A는 선물을 준 친구의 이름을 B는 선물을 받은 친구의 이름을 의미하며 공백 하나로 구분됩니다.
 A와 B는 friends의 원소이며 A와 B가 같은 이름인 경우는 존재하지 않습니다.
 */
