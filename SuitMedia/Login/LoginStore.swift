//
//  HomeStore.swift
//  SuitMedia
//
//  Created by Ferry Wijayanto on 25/04/20.
//  Copyright © 2020 Ferry Wijayanto. All rights reserved.
//

import Foundation

class LoginStore {
    
    func isPalindrome(word: String, success: @escaping () -> Void, failure: @escaping () -> Void) -> Bool {
        let characters = Array(word)
        var currentIndex = 0
        
        while currentIndex < characters.count / 2 {
            if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
                failure()
                return false
            }
            currentIndex += 1
        }
        success()
        
        return true
    }
}
