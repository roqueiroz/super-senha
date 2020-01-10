//
//  ViewController.swift
//  SuperSenha
//
//  Created by Rodrigo Queiroz on 29/12/19.
//  Copyright © 2019 Rodrigo Queiroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTotalPasswd: UITextField!
    @IBOutlet weak var txtTotalCharacters: UITextField!
    
    @IBOutlet weak var swtLetter: UISwitch!
    @IBOutlet weak var swtCapitalLetters: UISwitch!
    @IBOutlet weak var swtSpecialCharacters: UISwitch!
    @IBOutlet weak var swtNumbers: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //metodo usado para carregar parametros antes de chamar a View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let passwdViewCtrl = segue.destination as! PasswdsViewController
        
        if let qtdPassword = Int(txtTotalPasswd.text!){
            passwdViewCtrl.qtdPasswd = qtdPassword
        }
        
        if let qtdCharacters = Int(txtTotalCharacters.text!) {
            passwdViewCtrl.qtdCharacters = qtdCharacters
        }
        
        passwdViewCtrl.useLetters = swtLetter.isOn
        passwdViewCtrl.useSpecialCharacters = swtSpecialCharacters.isOn
        passwdViewCtrl.useCapitalLetters = swtCapitalLetters.isOn
        passwdViewCtrl.useNumbers = swtNumbers.isOn
        
        view.endEditing(true)
    }

}

