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
    @IBOutlet var openTodoButton: UIButton!
    @IBOutlet var openTimerButton: UIButton!
    @IBOutlet var openGalleryButton: UIButton!
    @IBOutlet var openNewsButton: UIButton!
    
    
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
        
        addAnimation(openTodoButton)
        addAnimation(openTimerButton)
        addAnimation(openGalleryButton)
        addAnimation(openNewsButton)
        
        
        
        emailOrNumber.text = Auth.auth().currentUser?.email
        if(emailOrNumber.text == nil){
            emailOrNumber.text = number
        }
        
    }
    
    func addAnimation(_ button : UIButton){
        
        // Animates the position
        let animate = CABasicAnimation(keyPath: "position")
        animate.fromValue = CGPoint(x: button.frame.midX+10, y: button.frame.midY)
        animate.toValue = NSValue(cgPoint: button.center)
        animate.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animate.duration = 0.5
        
        
        button.layer.add(animate, forKey: "position")
        
        
        
//        //Animates the opacity
        let animateOpacity = CABasicAnimation(keyPath: "opacity")
        animateOpacity.fromValue = 0
        animateOpacity.toValue = 1.0
        animateOpacity.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animateOpacity.duration = 0.5
        
        button.layer.add(animateOpacity, forKey: "opacity")
    }


}
