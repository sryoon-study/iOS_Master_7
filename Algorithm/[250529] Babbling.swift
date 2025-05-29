/*
문제 페이지
https://school.programmers.co.kr/learn/courses/30/lessons/120956?language=swift
*/

// 개별 단어가 유효한지 확인하는 함수
func isValid(_ word: String, using patterns: [String]) -> Bool {
    var remaining = word              // 아직 처리되지 않은 부분을 저장할 변수
    var previous = ""                 // 직전에 사용한 패턴을 기억하여 연속 사용 방지

    // 남은 문자열이 있을 동안 반복
    while !remaining.isEmpty {
        var matched = false           // 현재 반복에서 허용된 패턴과 매칭되었는지 여부
        
        for pattern in patterns {     // 모든 허용된 발음을 순회
            // 현재 남은 문자열이 해당 패턴으로 시작하고, 바로 전과 같은 패턴이 아닌 경우
            if remaining.hasPrefix(pattern) && pattern != previous {
                matched = true                // 유효한 발음으로 판단
                previous = pattern            // 이번에 사용한 패턴을 기억
                remaining.removeFirst(pattern.count) // 해당 패턴 길이만큼 문자열 앞부분 제거
                break                         // 이번 순회 종료
            }
        }

        // 어떤 패턴과도 매칭되지 않으면 유효하지 않은 단어로 판단
        if !matched {
            return false
        }
    }

    // 끝까지 조건을 만족한 경우 유효한 단어로 판단
    return true
}

// 주어진 단어 배열 중 유효한 단어 개수를 계산하는 함수
func solution(_ babbling: [String]) -> Int {
    let patterns = ["aya", "ye", "woo", "ma"] // 발음할 수 있는 허용된 패턴 목록

    // 각 단어에 대해 isValid 검사 후, true인 것만 필터링하여 개수 반환
    return babbling.filter { isValid($0, using: patterns) }.count
}


