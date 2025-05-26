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
        msg.printWelcomeMessage()
        //정답 생성하기
        let answerArray = answer.createAnswer()
        //테스트용코드
        print("testcode : \(answerArray)")

        while true{
            
        //숫자입력 메시지 출력
        msg.printRequireNumberMessage()

        //숫자 입력받기
        if let input = inputNumber.getInputNumber(){
                let result = answer.checkAnswer(input)
                print(result)

                if input == answer.answer {
                    break
                }

            } else {
                msg.printInvalidInputMessage()
            }
        
        }

    }

}
