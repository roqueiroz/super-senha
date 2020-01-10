//
//  PasswdsViewController.swift
//  SuperSenha
//
//  Created by Rodrigo Queiroz on 03/01/20.
//  Copyright © 2020 Rodrigo Queiroz. All rights reserved.
//

import UIKit

class PasswdsViewController: UIViewController {

    
    @IBOutlet weak var txtPasswds: UITextView!
    
    var qtdPasswd: Int = 1
    var qtdCharacters: Int = 6
    var useLetters: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    var useNumbers: Bool!
    
    var passwdGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Total de senhas: \(qtdPasswd)"
        
        passwdGenerator = PasswordGenerator(qtdPasswd: qtdPasswd,
                                            qtdCharacters: qtdCharacters,
                                            useLetters: useLetters,
                                            useCapitalLetters: useCapitalLetters,
                                            useSpecialCharacters: useSpecialCharacters,
                                            useNumbers: useNumbers)
        
        generatePassword()
    }
    
    func generatePassword() {
        
        txtPasswds.scrollRangeToVisible(NSRange(location: 0, length: 0))
        txtPasswds.text = ""
        
        let passwords = passwdGenerator.generate(total: qtdPasswd)
        
        for passwd in passwords {
            txtPasswds.text.append(passwd + "\n\n")
        }
    }
    
    @IBAction func btnGenerate(_ sender: UIButton) {
        generatePassword()
    }
    
    
}
