// Controller/RecordController.swift
import Foundation

class RecordController {
    // 객체 생성
    private var record = RecordModel()
    private let msg = MsgController()

    // 시도횟수를 추가
    func addRecord(tryCount: Int) {
        record.addRecord(tryCount)
    }

    // 기록 존재여부 유효성체크
    func isRecord() -> Bool {
        return !record.isEmpty()
    }

    // 기록 결과를 출력
    func makeRecordList() -> String {
        let tries = record.getAllRecords()
        var result = ""

        // TODO: 고차함수(map, joined)으로 변경
        for (index, count) in tries.enumerated() {
            result += "\(index + 1)\(msg.getRecordListMessage())\(count)회\n"
        }

        // 양 끝의 줄바꿈문자를 제거해서 리턴
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
