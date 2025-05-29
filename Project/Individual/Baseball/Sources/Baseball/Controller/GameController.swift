// Controller/GameController.swift
import Foundation

class GameController {
    // MsgController 객체 생성
    let msg = MsgController()
    // InputNuberController 객체 생성
    let inputNumber = InputNumberController()
    // AnswerController 객체 생성
    let answer = AnswerController()
    // RecordController 객체 생성
    let records = RecordController()
    // ConsoleView 객체 생성
    let view = ConsoleView()

    // 메인메뉴
    func menu() {
        // 제어변수
        var isFirst = true
        while true {
            // 최초라면 환영 메시지 출력
            if isFirst {
                view.showMessage(msg.getWelcomeMessage())
                isFirst = false
            }

            // 메뉴 메시지출력
            view.showMessage(msg.getMenuMessage())

            // 숫자 입력받기
            guard let input = inputNumber.getInputMenuNumber(), let selected = Menu(rawValue: input) else {
                // 잘못된 입력 메시지 출력
                view.showMessage(msg.getInvalidInputMenuNumberMessage())
                continue
            }
            switch selected {
            case .start:
                startGame()
            case .records:
                showRecords()
            case .exit:
                exitGame()
            }
        }
    }

    // 야구게임
    func startGame() {
        // 게임 시작 메시지 출력
        view.showMessage(msg.getStartingMessage())
        // 정답 생성하기
        let answerArray = answer.createAnswer()
        // 테스트용 정답출력
        view.showMessage("testcode : \(answerArray)")

        // 시행횟수 변수
        var tryCnt = 0

        while true {
            // 숫자입력 메시지 출력
            view.showMessage(msg.getRequireNumberMessage())

            // 숫자 입력받기
            guard let input = inputNumber.getInputBaseballNumber() else {
                // 잘못된 입력 메시지 출력
                view.showMessage(msg.getInvalidInputGameNumberMessage())
                continue
            }

            // 시행횟수 추가
            tryCnt += 1

            // 판정 결과 출력
            let result = answer.checkAnswer(input)
            view.showMessage(result)

            // 정답일 경우 break
            if input == answer.answer {
                records.addRecord(tryCount: tryCnt)
                break
            }
        }
    }

    func showRecords() {
        if records.isRecord() {
            // 기록이 있을 경우
            view.showMessage(msg.getRecordTitleMessage())
            view.showMessage(records.makeRecordList())
        } else {
            // 기록이 없을 경우
            view.showMessage(msg.getNoneRecordMessage())
        }
    }

    func exitGame() {
        // 종료 메시지 출력
        view.showMessage(msg.getShutDownMessage())

        exit(0)
    }
}
