// Controller/MsgController.swift
import Foundation

class MsgController {
    func getWelcomeMessage() -> String {
        return MsgModel.welcomeMessage
    }

    func getMenuMessage() -> String {
        return MsgModel.menuMessage
    }

    func getStartingMessage() -> String {
        return MsgModel.startingMessage
    }

    func getRequireNumberMessage() -> String {
        return MsgModel.requireNumberMessage
    }

    func getInvalidInputMenuNumberMessage() -> String {
        return MsgModel.invalidInputMenuNumberMessage
    }

    func getInvalidInputGameNumberMessage() -> String {
        return MsgModel.invalidInputGameNumberMessage
    }

    func getCorrectAnswerMessage() -> String {
        return MsgModel.correctAnswerMessage
    }

    func getNothingMessage() -> String {
        return MsgModel.nothingMessage
    }

    func getShutDownMessage() -> String {
        return MsgModel.shutDownMessage
    }

    func getInvalidAccessMessage() -> String {
        return MsgModel.invalidAccessMessage
    }

    func getRecordTitleMessage() -> String {
        return MsgModel.recordTitleMessage
    }

    func getRecordListMessage() -> String {
        return MsgModel.recordlistMessage
    }

    func getNoneRecordMessage() -> String {
        return MsgModel.noneRecordMessage
    }
}
