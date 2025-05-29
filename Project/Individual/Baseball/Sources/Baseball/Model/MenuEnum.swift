// Model/MenuEnum.swift
import Foundation

enum Menu: Int {
    case start = 1
    case records
    case exit

    static func isValid(_ input: Int) -> Bool {
        return Menu(rawValue: input) != nil
    }
}
