//
//  OtpViewController.swift
//  loginProject
//
//  Created by Ground 2 on 18/03/24.
//

import UIKit

class OtpViewController: UIViewController {
    
    @IBOutlet var otpSentToLabel: UILabel!
    
    @IBOutlet var otpDigit1: UITextField!
    
    @IBOutlet var otpDigit2: UITextField!
    @IBOutlet var otpDigit3: UITextField!
    @IBOutlet var otpDigit4: UITextField!
    @IBOutlet var otpDigit5: UITextField!
    @IBOutlet var otpDigit6: UITextField!
    
    @IBOutlet var resendCodeButton: UIButton!
    
    var textfieldList : [UITextField?] = []
    var timer = Timer()
    var timeToResend = 60
    var emailOrNumber = ""
    var countryCode = ""

    @IBAction func verifyAction(_ sender: Any) {
        let otp = otpFromTextfields()
        print(otp)
        if(otp.count != 6){
            Helpers().presentAlertBox("Incomplete Otp", self)
            return
        }
        
        
        FirebaseFunctions().verifyCode(otp) { success in
            
            if(success){
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: "DataScreen") as! DataViewController
                
                vc.number = self.emailOrNumber
                
                self.navigationController?.setViewControllers([vc], animated: true)
            }
            else{
                Helpers().presentAlertBox("Code Verification Failed", self)
            }
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimerForResendButton()
        textfieldList = [otpDigit1,otpDigit2,otpDigit3,otpDigit4,otpDigit5,otpDigit6]
        otpDigit1.becomeFirstResponder()
        highlightTextField(otpDigit1)
        
        otpDigit1.delegate = self
        otpDigit2.delegate = self
        otpDigit3.delegate = self
        otpDigit4.delegate = self
        otpDigit5.delegate = self
        otpDigit6.delegate = self
        
        
        otpDigit1.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpDigit2.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpDigit3.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpDigit4.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpDigit5.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpDigit6.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        otpSentToLabel.text = "We've sent verification code to \(emailOrNumber)"
        
        
        otpDigit1.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)
        otpDigit2.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)
        otpDigit3.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)
        otpDigit4.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)
        otpDigit5.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)
        otpDigit6.addTarget(self, action: #selector(onTouchBegin), for: .editingDidBegin)

    }
    
    @objc func onTouchBegin(textField : UITextField){
        
        textField.text = "."
        textField.textColor = UIColor(named: "otpTextBg")
        
    }
    
    
    
    


}
