import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    // 중복 제거
    let reportSet = Set(report)
    var reportedDict: [String: Set<String>] = [:]
    
    // [피신고자 : [신고자, 신고자] 딕셔너리 만들기
    reportSet.forEach{
        let split = $0.split(separator: " ").map{ String($0)}
        let reporter = split[0]
        let reported = split[1]
        reportedDict[reported, default: []].insert(reporter)
    }
    
    // 정지된 사용자 추출
    let banndUsers = reportedDict.filter{ $0.value.count >= k }.map { $0.key }
    
    // 정지된 유저 && 이 아이디가 그 사람을 신고한적이 있는지 -> 횟수 타임아웃
//    let result = id_list.map { id in
//        reportedDict.filter{ banndUsers.contains($0.key) && $0.value.contains(id) }.count
//    }
    
    // 메일 수 저장
    var mailCounts: [String: Int] = [:]
    
    // 정지된 사람 기준으로 신고한 사람들을 꺼내서 각각 메일 수 증가
    for id in banndUsers {
        for reporter in reportedDict[id] ?? [] {
            mailCounts[reporter, default: 0] += 1
        }
    }
                               
    // 결과는 id_list 순서대로
    return id_list.map { mailCounts[$0, default: 0] }
}

let id_list = ["muzi", "frodo", "apeach", "neo"]
let report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let k = 2

print(solution(id_list, report, k))

/*
 
 ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
 
 */
