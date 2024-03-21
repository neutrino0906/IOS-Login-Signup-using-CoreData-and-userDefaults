//
//  StringExtensions.swift
//  loginProject
//
//  Created by Ground 2 on 21/03/24.
//

import Foundation

extension String{
    var isNumber: Bool {
            let digitsCharacters = CharacterSet(charactersIn: "0123456789")
            return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
        }
}
