// Controller/AnswerController.swift
import Foundation

class AnswerController {

    // 정답 저장용 변수
    var answer: [Int] = []

    // 정답 생성
    func createAnswer() -> [Int] {
        while true {
            let number = Int.random(in: 100...999)
            let digits = String(number).compactMap { $0.wholeNumberValue }
            let digitSet = Set(digits)

            if digitSet.count == 3 {
                answer = digits
                return digits
            }
        }
    }

    // 정답 체크
    func checkAnswer(_ input: [Int]) -> String {
        // 정답 완전 일치 여부 확인
        if input == answer {
            return MsgModel.correctAnswerMessage
        }

        var strikeCnt = 0
        var ballCnt = 0

        // 각 자리 비교
        for i in 0..<3 {
            if input[i] == answer[i] {
                strikeCnt += 1
            } else if answer.contains(input[i]) {
                ballCnt += 1
            }
        }

        // 결과 메시지 조합
        if strikeCnt == 0 && ballCnt == 0 {
            return MsgModel.nothingMessage
        }

        var result = ""
        if strikeCnt > 0 {
            result += "\(strikeCnt)스트라이크 "
        }
        if ballCnt > 0 {
            result += "\(ballCnt)볼"
        }

        return result
    }
}