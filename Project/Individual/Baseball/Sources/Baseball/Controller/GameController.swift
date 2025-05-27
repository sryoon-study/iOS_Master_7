// Controller/GameController.swift
import Foundation

class GameController {

    //MsgController 객체 생성
    let msg = MsgController()
    //InputNuberController 객체 생성
    let inputNumber = InputNumberController()
    //AnswerController 객체 생성
    let answer = AnswerController()

    func start() {
        //환영 메시지 출력
        print(msg.getWelcomeMessage())
        //정답 생성하기
        let answerArray = answer.createAnswer()
        //테스트용코드
        print("testcode : \(answerArray)")

        while true{
            
        //숫자입력 메시지 출력
        print(msg.getRequireNumberMessage())

              //숫자 입력받기
            guard let input = inputNumber.getInputNumber() else {
                // 잘못된 입력 메시지 출력
                print(msg.getInvalidInputMessage())
                continue
            }
            //판정 결과 출력
            let result = answer.checkAnswer(input)
            print(result)

            //정답일 경우 break
            if input == answer.answer {
                break
            }
        
        }

    }

}
