//
//  userDefaults.swift
//  loginProject
//
//  Created by Ground 2 on 20/03/24.
//

import Foundation

class userdefaults{
    let isUserSignedIn = "IS_USER_SIGNED_IN"
    let currentUser = "CURRENT_USER"
    
    func setSignedIn(_ isSignedIn: Bool){
        UserDefaults.standard.set(isSignedIn, forKey: isUserSignedIn)
    }
    
    func getSignedIn() -> Bool{
        return UserDefaults.standard.bool(forKey: isUserSignedIn)
    }
    
    func setCurrentUser(_ currentUserEmail: String){
        UserDefaults.standard.set(currentUserEmail, forKey: currentUser)
    }
    
    func getCurrentUser() -> String
    {
        return UserDefaults.standard.string(forKey: currentUser) ?? "No User Found"
    }
}
