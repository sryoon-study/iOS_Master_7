//Controller/InputNumberController.swift
import Foundation

class InputNumberController{
    //입력한 숫자 획득
    func getInputNumber()-> [Int]? {

        //공백체크, 입력받은 값이 세자리 정수인지 체크
        guard let input = readLine(), checkInputNumber(input) else {
            //TODO 예외처리
            return nil
        }

        //배열반환
        return createInputArray(input)
    }

    //유효성 체크
    func checkInputNumber(_ input: String)-> Bool{
        //길이검사
        guard input.count == 3 else { return false }

        //첫 글자가 0인지 검사
        if input.first == "0"{
            return false
        }

        //전부 숫자인지 검사
        let isAllDigits = input.allSatisfy { $0.isNumber }
        return isAllDigits
    }

    // 입력 자열을 Int 배열로 변환
    func createInputArray(_ input: String)-> [Int]{
        return input.compactMap { $0.wholeNumberValue}
    }

}
