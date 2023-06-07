//
//  LoginVC.swift
//  Envoy
//
//  Created by Hassane Sidibe on 6/5/23.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //SHOW AN ALERT IF USER IS NOT ABLE TO LOGIN
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {result, error in
                if error != nil {
                    //Show an alert saying "Email or password is incorrect."
                    self.showIncorrectEmailOrPasswordAlert()
                    print(error!)
                    
                    
                    
                } else {
                    //Segue to MessageVC
                    
                    print("Success login user in 🎉")
                }
            }
        }
    }
    
    
    func showIncorrectEmailOrPasswordAlert() {
        let alert = UIAlertController(title: "Unable to login", message: "Incorrect email or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) {alertAction in
            print("Ok button pressed in the alert")
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
//    0 "from:3473359577;How are you?"
//    1 "from:6462627079;Good!"
//    2 "from:6462627079;How have you been?"

}
