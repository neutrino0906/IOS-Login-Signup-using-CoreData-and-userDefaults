//
//  SignInEmailPasswordInteractor.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import Foundation

class Interactor: InteractorProtocols{

    
    var validEmail = false
    var validPassword = false
    var error1 = "Enter valid Email"
    
    var presenter : Presenter?
    
    
    
    func checkEmailPassword(_ email: String,_ password: String){
            let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
            
            do {
                let regex = try NSRegularExpression(pattern: emailRegEx)
                let nsString = email as NSString
                let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
                
                if results.count == 0
                {
                    validEmail = true
                    error1 = ""
                }
                
            } catch _ as NSError {
                validEmail = false
                error1 = "Something Went Wrong"
            }
        
        if(password.count >= 6) {
            validPassword = true
        }
        else{
            if(error1=="") {
                error1 = "Password must be at least 6 characters long"
            }
        }
        
        emailPasswordChecked(error1)
    }
    
    func emailPasswordChecked(_ error: String){
        presenter?.emailPasswordChecked(validEmail && validPassword, error)
    }
    
}
