//
//  ViewController.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import UIKit
import FirebaseAuth

class SignInEmailPasswordViewController: UIViewController, SignInEmailPasswordViewProtocol{
    
    let firebaseFunction = FirebaseFunctions()
    var presenter = Presenter()
    var interactor = Interactor()
    
    @IBOutlet var userEmailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var togglePasswordVisibilityButton: UIButton!
    @IBOutlet var signInEmailPasswordButton: UIButton!
    
    
    
    
    @IBAction func togglePasswordVisibilityAction(_ sender: Any) {
        
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        
        if(passwordTextField.isSecureTextEntry){
            togglePasswordVisibilityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        else{
            togglePasswordVisibilityButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    
    
    //Sign In Button Action
    @IBAction func signInWithEmailPasswordAction(_ sender: Any) {
        presenter.checkEmailPassword(userEmailTextField.text ?? "", passwordTextField.text ?? "")
        
    }
    
    
    //Checks whether the entered credentials format is correct or not
    func emailPasswordChecked(_ result : Bool,_ error: String){
        signInEmailPasswordButton.isEnabled = false
        if(Database().checkUserInCoreData(userEmailTextField.text ?? "")){
            print("Fetched Directly from database...")
            let vc = self.storyboard?.instantiateViewController(identifier: "DataScreen") as! DataViewController
            
            self.navigationController?.setViewControllers([vc], animated: true)
        }
        else{
            print("Fetching from Firebase...")
            firebaseFunction.FirebaseSignIn(userEmailTextField.text ?? "", passwordTextField.text ?? "", self)
        }
    }
    
    
    //Switches to login with number Screen
    @IBAction func switchToPhoneNumberAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "SignInWithPhoneNumberScreen") as! SignInPhoneNumberViewController
        self.navigationController?.setViewControllers([vc], animated: true)
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if userdefaults().getSignedIn() {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DataScreen") as! DataViewController
            self.navigationController?.setViewControllers([vc], animated: true)
        }
        setNeedsStatusBarAppearanceUpdate()
        
        
        
        presenter.interactor = interactor
        presenter.emailPasswordView = self
        interactor.presenter = presenter
        
        userEmailTextField.layer.borderWidth = 1.0
        userEmailTextField.layer.cornerRadius = 4
        userEmailTextField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        
    }


}

