//
//  FirebaseFunctions.swift
//  loginProject
//
//  Created by Ground 2 on 19/03/24.
//

import Foundation
import Firebase
import UIKit

class FirebaseFunctions {
    let auth = Auth.auth()
    
    
    func FirebaseSignIn(_ email : String, _ password: String, _ controller : SignInEmailPasswordViewController){
        auth.signIn(withEmail: email, password: password) { AuthDataResult, Error in
            if let Error = Error{
                Helpers().presentAlertBox(Error.localizedDescription, controller)
                controller.signInEmailPasswordButton.isEnabled = true
            }
            
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DataScreen") as! DataViewController
//            vc.number = email
            controller.navigationController?.setViewControllers([vc], animated: true)
            
            
        }
    }
    func FirebaseSignUp(_ email : String, _ password: String, _ name: String, _ phoneNumber: String, _ controller : UIViewController){
            Auth.auth().createUser(withEmail: email, password: password) { Result, Error in
                if let Error = Error{
                    Helpers().presentAlertBox(Error.localizedDescription, controller)
                }
                Database().addToCoreData(name: name, email: email, phoneNumber: phoneNumber)
                    let vc = controller.storyboard?.instantiateViewController(identifier: "DataScreen") as! DataViewController
                    controller.navigationController?.setViewControllers([vc], animated: true)
                
                
            }
        }
    
    
    
    
    
    func sendVerificationCode(to phoneNumber: String, completion: @escaping (Bool) -> Void)
    {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                  completion(false)
                  return
              }
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
              completion(true)
          }
    }
    
    func verifyCode(_ code: String, completion: @escaping (Bool) -> Void)
    {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        
        print(verificationID)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            
            if let error = error {
                completion(false)
            }
            
            completion(true)
        }
    }
        
        
    }
