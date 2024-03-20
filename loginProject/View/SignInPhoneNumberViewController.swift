//
//  SignInPhoneNumberViewController.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import UIKit
import Firebase

class SignInPhoneNumberViewController: UIViewController {
    @IBOutlet var phoneNumberTextField: UITextField!
    
    @IBOutlet var SignInWithNumberButton: UIButton!
    
    
    
    //Sign in using phone number button Action
    @IBAction func signInWithPhoneNumberAction(_ sender: Any) {
        
        
        if(phoneNumberTextField?.text?.count != 10){
            let alert = UIAlertController(title: "Warning", message: "Invalid Phone Number", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            
        }else{
            SignInWithNumberButton.isEnabled = false
            
            FirebaseFunctions().sendVerificationCode(to: "+91\(phoneNumberTextField.text!)") { success in
                if(success){
                    let vc = UIStoryboard.init(name: "OtpStoryboard", bundle: Bundle.main).instantiateViewController(identifier: "OtpScreen") as! OtpViewController
                    
                    vc.emailOrNumber = self.phoneNumberTextField.text!
                    
                    self.navigationController?.setViewControllers([vc], animated: true)
                }
                else{
                    self.SignInWithNumberButton.isEnabled = true
                }
            }
        }
    }
    
    
    //This switches to login with email Screen
    @IBAction func switchToEmailAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SignInEamilPasswordScreen") as! SignInEmailPasswordViewController
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNumberTextField.layer.borderWidth = 1.0
        phoneNumberTextField.layer.cornerRadius = 4
        phoneNumberTextField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
    }
    

}
