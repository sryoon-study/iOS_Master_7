// Model/MsgModel.swift
import Foundation


struct RecordModel {

    //게임 횟수 보관 배열
    var triesPerGame: [Int] = []

    //게임 횟수를 배열에 추가
    mutating func addRecord(_ tryCount: Int) {
        triesPerGame.append(tryCount)
    }

    //모든 게임 횟수를 획득
    func getAllRecords() -> [Int] {
        return triesPerGame
    }

    //존재 체크
    func isEmpty() -> Bool {
        return triesPerGame.isEmpty
    }
}

