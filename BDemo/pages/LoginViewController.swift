//
//  ViewController.swift
//  BDemo
//
//  Created by Jacopo Pappalettera on 30/05/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameField.text = "pippo"
        self.pwdField.text = "123"
        // Do any additional setup after loading the view.
    }
    @IBAction func loginAction(_ sender: Any) {
        guard let userName = self.usernameField.text,
              let password = self.pwdField.text else { return }
        if (UserDataManager.shared.performLogin(username: userName, pwd: password)){
            RouterManager.shared.goToMainMenu()
        }else{
            print("not logged");
        }
    }
    @IBAction func registerAction(_ sender: Any) {
        UserDataManager.shared.performRegistration(username: "pippo", pwd: "123")
    }
}

