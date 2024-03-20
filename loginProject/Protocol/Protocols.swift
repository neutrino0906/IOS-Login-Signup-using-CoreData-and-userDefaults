//
//  Protocols.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import Foundation

protocol SignInEmailPasswordViewProtocol{
    func emailPasswordChecked(_ result : Bool, _ error: String)
}

protocol PresenterProtocol{
    
    func checkEmailPassword(_ email: String, _ password: String)
    func emailPasswordChecked(_ result: Bool, _ error : String)
    
}

protocol InteractorProtocols{
    func checkEmailPassword(_ email: String, _ password: String)
    func emailPasswordChecked(_ error: String)
}
