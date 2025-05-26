//Controller/MsgController.swift
import Foundation

class MsgController{
    //welcomeMessage 출력
    func printWelcomeMessage() {       
        print(MsgModel.welcomeMessage)
    }
    //숫자 입력 메시지 출력
    func printRequireNumberMessage(){    
        print(MsgModel.requireNumberMessage)
    }
    //에러 메시지 출력
    func printInvalidInputMessage(){    
        print(MsgModel.invalidInputMessage)
    }
    //정답 메시지 출력
    func printCorrectAnswerMessage(){    
        print(MsgModel.correctAnswerMessage)
    }
}