//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Rodrigo Queiroz on 03/01/20.
//  Copyright © 2020 Rodrigo Queiroz. All rights reserved.
//

import Foundation

class PasswordGenerator {

    var qtdPasswd: Int
    var qtdCharacters: Int
    var useLetters: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    var useNumbers: Bool

	var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_-+=`˜|]}[{';:?/<>.,"
    private let numbers = "0123456789"
    
    init(qtdPasswd: Int, qtdCharacters: Int, useLetters: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool, useNumbers: Bool) {
        
        var numChars = min(qtdCharacters, 16)
        numChars = max(numChars, 6)
        
        self.qtdPasswd = qtdPasswd
        self.qtdCharacters = qtdCharacters
        self.useLetters = useLetters
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
        self.useNumbers = useNumbers
        
        
    }
    
    func generate(total: Int) -> [String] {
        
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            
            var passwd = ""
            
            //loop para gerar senha com a quantidade de caracters escolhido pelo usuario
            for _ in 1...qtdCharacters{
                
                //pega um index aleatorio dentro do universo de caracteres escolhidos
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                
                //pega um caracter aleatorio baseado no index
                passwd += String(universeArray[index])
                
            }
            
            passwords.append(passwd)
        }
        
        return passwords
    }
    
}
