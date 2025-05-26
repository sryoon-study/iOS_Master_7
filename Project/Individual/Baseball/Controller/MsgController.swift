//Controller/MsgController.swift
import Foundation

class MsgController{
    func printWelcomeMessage() {
        // MsgModel의 static 상수에 접근
        print(MsgModel.welcomeMessage)
    }
}