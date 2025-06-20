//
//  main.swift
//  programmers
//
//  Created by Yoon on 6/5/25.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    
    for h in 3...total {
        if total % h == 0 {
            let w = total / h
            if w >= h {
                if (w - 2 ) * (h - 2) == yellow {
                    return [w, h]
                }
            }
        }
    }
    
    return []
}

