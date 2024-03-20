//
//  SignUpViewController.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
    
    
    var presenter = Presenter()
    var interactor = Interactor()
    
    //Sign Up button Action
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        if((nameTextField.text) == ""){
            presentAlertBox("Please enter your name!")
        }
        else if((emailTextField.text) == ""){
            presentAlertBox("Please enter your email!")
        }
        else if((passwordTextField.text) == ""){
            presentAlertBox("Please enter valid password!")
        }
        else if((nameTextField.text) == ""){
            presentAlertBox("Please confirm your password!")
        }
        else if((phoneNumberTextField.text) == ""){
            presentAlertBox("Please enter your phone number!")
        }
        else if(passwordTextField.text != confirmPasswordTextField.text){
            presentAlertBox("Password and Re-entered password do not match")
        }
        else{
            FirebaseFunctions().FirebaseSignUp(emailTextField.text ?? "", passwordTextField.text ?? "",nameTextField.text ?? "",phoneNumberTextField.text ?? "",  self)
            
            
            
        }
        
    }
    
    func presentAlertBox(_ message: String){
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.signUpView = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        createBorderAroundTextfield(emailTextField)
        createBorderAroundTextfield(passwordTextField)
        createBorderAroundTextfield(confirmPasswordTextField)
        createBorderAroundTextfield(nameTextField)
        createBorderAroundTextfield(phoneNumberTextField)
    }
    
    func createBorderAroundTextfield(_ textField : UITextField){
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
    }
    

}
