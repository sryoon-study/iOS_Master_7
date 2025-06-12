import Foundation

func solution(_ clothes:[[String]]) -> Int {
    let categories = Set(clothes.map{ $0[1] })
    var cntArr: [Int] = []
    for category in categories {
        var cnt = clothes.filter { $0[1] == category }.count
        cnt+=1
        cntArr.append(cnt)
    }
    return cntArr.reduce(1, *) - 1
    
}

//let clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]

let clothes = [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]

solution(clothes)

func solution2(_ clothes: [[String]]) -> Int {
    Dictionary(grouping: clothes, by: { $0[1] })
        .values
        .map { $0.count + 1 }
        .reduce(1, *) - 1
}
