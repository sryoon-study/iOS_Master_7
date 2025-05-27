// Controller/AnswerController.swift
import Foundation

class AnswerController {

    // 정답 저장용 변수
    var answer: [Int] = []

    // 정답 생성
    func createAnswer() -> [Int] {
        //(1) 1에서 9까지 무작위로 섞어서 1개를 추출
        let firstDigit = Array(1...9).shuffled().prefix(1)
        //(2) 0에서 9 중 (1)에서 뽑은 숫자를 제외하고 무작위로 섞어서 2개를 추출
        let remainingDigits = Array(0...9).filter { !firstDigit.contains($0) }.shuffled().prefix(2)
        //(1)과 (2를) 합침
        let digits = firstDigit + remainingDigits

        answer = Array(digits)

        return answer
    }

    // 정답 체크
    func checkAnswer(_ input: [Int]) -> String {

        //완전히 일치할 경우 정답메시지 리턴
        if input == answer {
            return MsgModel.correctAnswerMessage
        }

        //일치하는 경우 스트라이크 카운트+1
        let strikeCnt = zip(input, answer).filter { $0 == $1 }.count
        
        //포함하는 경우 볼카운트+1 - 스트라이크 카운트
        let ballCnt = input.filter { answer.contains($0) }.count - strikeCnt

        //전부 불일치일 경우 nothing 메시지 출력
        if strikeCnt == 0 && ballCnt == 0 {
            return MsgModel.nothingMessage
        }

        //결과 메시지 생성후 리턴
        var result = ""
        if strikeCnt > 0 { result += "\(strikeCnt)스트라이크 " }
        if ballCnt > 0 { result += "\(ballCnt)볼" }

        return result.trimmingCharacters(in: .whitespaces)
    }
}