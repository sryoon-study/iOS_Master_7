func solution2(_ friends:[String], _ gifts:[String]) -> Int {
    
    var giftDict: [String: [String: Int]] = [:]
    var giftIndex: [String: Int] = [:]
    
    for gift in gifts {
        let split = gift.split(separator: " ")
        let from = String(split[0])
        let to = String(split[1])
        giftDict[from, default: [:]][to, default: 0] += 1
        giftIndex[from, default: 0] += 1
        giftIndex[to, default: 0] -= 1
    }
    
    var nextGiftCount: [String: Int] = [:]
    
    
    for (index, friend) in friends.enumerated() {
        for offset in (index + 1) ..< friends.count {
            
            let target = friends[offset]
            let putCount = giftDict[friend]?[target] ?? 0
            let getCount = giftDict[target]?[friend] ?? 0
            
            if putCount > getCount {
                nextGiftCount[friend, default: 0] += 1
            } else if putCount < getCount {
                nextGiftCount[target, default: 0] += 1
            } else { 
                let friendCount = giftIndex[friend] ?? 0
                let targetCount = giftIndex[target] ?? 0
                if friendCount > targetCount {
                    nextGiftCount[friend, default: 0] += 1
                } else if friendCount < targetCount {
                    nextGiftCount[target, default: 0] += 1
                }
            }
        }
    }
    
    return nextGiftCount.values.max() ?? 0
}
