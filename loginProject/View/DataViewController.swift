//
//  DataViewController.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import UIKit
import Firebase

class DataViewController: UIViewController {
    @IBOutlet var emailOrNumber: UILabel!
    var number: String = ""
    
    
    @IBAction func openTodoApp(_ sender: Any) {
        let todoApplicationUrl : NSString = "todoApplication://"
        UIApplication.shared.open(URL(string: todoApplicationUrl as String)!)
    }
    
    @IBAction func openTimerApp(_ sender: Any) {
        let todoApplicationUrl : NSString = "timerApplication://"
        UIApplication.shared.open(URL(string: todoApplicationUrl as String)!)
        
    }
    
    @IBAction func openGalleryApp(_ sender: Any) {
        let todoApplicationUrl : NSString = "galleryApplication://"
        UIApplication.shared.open(URL(string: todoApplicationUrl as String)!)
        
    }
    
    @IBAction func openNewsApp(_ sender: Any) {
        let todoApplicationUrl : NSString = "newsApplication://"
        UIApplication.shared.open(URL(string: todoApplicationUrl as String)!)
        
    }
    
    
    
    
    @IBAction func signOutButtonAction(_ sender: Any) {
        do {
            userdefaults().setSignedIn(false)
            try Auth.auth().signOut()
            let vc = self.storyboard?.instantiateViewController(identifier: "SignInEamilPasswordScreen") as! SignInEmailPasswordViewController
            self.navigationController?.setViewControllers([vc], animated: true)
        }
        catch{
            print("Not Signed Out")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userdefaults().setSignedIn(true)
        
        
        
        emailOrNumber.text = Auth.auth().currentUser?.email
        if(emailOrNumber.text == nil){
            emailOrNumber.text = number
        }
        
    }


}
