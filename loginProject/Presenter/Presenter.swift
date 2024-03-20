//
//  Presenter.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import Foundation

class Presenter: PresenterProtocol{
    
    var interactor: Interactor?
    var emailPasswordView: SignInEmailPasswordViewController?
    var signUpView : SignUpViewController?
//    var otpView : OtpViewController
    
    func checkEmailPassword(_ email: String, _ password: String) {
        interactor?.checkEmailPassword(email, password)
    }
    
    func emailPasswordChecked(_ result: Bool, _ error : String) {
        emailPasswordView?.emailPasswordChecked(result, error)
    }
    
    
    
}
