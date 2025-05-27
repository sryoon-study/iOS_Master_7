//Controller/MsgController.swift
import Foundation

class MsgController {
    func getWelcomeMessage() -> String {
        return MsgModel.welcomeMessage
    }

    func getRequireNumberMessage() -> String {
        return MsgModel.requireNumberMessage
    }

    func getInvalidInputMessage() -> String {
        return MsgModel.invalidInputMessage
    }

    func getCorrectAnswerMessage() -> String {
        return MsgModel.correctAnswerMessage
    }

    func getNothingMessage() -> String {
        return MsgModel.nothingMessage
    }
}