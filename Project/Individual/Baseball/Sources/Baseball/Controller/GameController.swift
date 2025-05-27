// Controller/GameController.swift
import Foundation

class GameController {

    //MsgController 객체 생성
    let msg = MsgController()
    //InputNuberController 객체 생성
    let inputNumber = InputNumberController()
    //AnswerController 객체 생성
    let answer = AnswerController()
    //RecordController 객체 생성
    let records = RecordController()
  
  
    //메인메뉴
    func menu() {
        //제어변수
        var isFirst = true
        while true{

            //최초라면 환영 메시지 출력
            if isFirst{
                print(msg.getWelcomeMessage())
                isFirst = false
            }
            
            //메뉴 메시지출력
            print(msg.getMenuMessage())
            
            //숫자 입력받기
                guard let input = inputNumber.getInputMenuNumber() else {
                    // 잘못된 입력 메시지 출력
                    print(msg.getInvalidInputMenuNumberMessage())
                    continue
                }
                switch input {
                    case 1: startGame()
                    case 2: showRecords()
                    case 3: exitGame()
                    default:
                        //비정상적인 접근 방어코드
                        print(msg.getInvalidAccessMessage())
                        exit(1)
                }
            
            }

    }

    //야구게임
    func startGame() {
        //게임 시작 메시지 출력
        print(msg.getstartingMessage())
        //정답 생성하기
        let answerArray = answer.createAnswer()
        //테스트용 정답출력
        print("testcode : \(answerArray)")

        //시행횟수 변수
        var tryCnt=0

        while true{        
            //숫자입력 메시지 출력
            print(msg.getRequireNumberMessage())

            //숫자 입력받기
            guard let input = inputNumber.getInputBaseballNumber() else {
                // 잘못된 입력 메시지 출력
                print(msg.getInvalidInputGameNumberMessage())
                continue
            }

            //시행횟수 추가
            tryCnt+=1

            //판정 결과 출력
            let result = answer.checkAnswer(input)
            print(result)

            //정답일 경우 break
            if input == answer.answer {
                records.addRecord(tryCount: tryCnt)
                break
            }
        
        }

    }

    func showRecords(){

         if records.isRecord() {
            //기록이 있을 경우
            print(msg.getRecordTitleMessage())
            print(records.makeRecordList())
        } else {
            //기록이 없을 경우
            print(msg.getNoneRecordMessage())
        }

    }

    func exitGame(){
        //종료 메시지 출력
        print(msg.getShutDownMessage())

        exit(0)
    }

}
