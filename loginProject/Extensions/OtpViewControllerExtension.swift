//
//  OtpViewControllerExtension.swift
//  loginProject
//
//  Created by Ground 2 on 20/03/24.
//

import Foundation
import UIKit

extension OtpViewController: UITextFieldDelegate{
    
    func otpFromTextfields() -> String{
        var otp = ""
        
        otp += otpDigit1.text ?? ""
        otp += otpDigit2.text ?? ""
        otp += otpDigit3.text ?? ""
        otp += otpDigit4.text ?? ""
        otp += otpDigit5.text ?? ""
        otp += otpDigit6.text ?? ""
        
        
        return otp
        
    }
    
    
    
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        
        var j = 0
        
        if(text!.count > 6){
            textField.text = ""
            textField.resignFirstResponder()
            return
        }
        
        if text?.count == 6{
            for i in text!{
                textfieldList[j]!.text = String(i)
                textfieldList[j]?.resignFirstResponder()
                j += 1
                
            }
            otpDigit6.becomeFirstResponder()
            highlightTextField(otpDigit6)
            return
        }
        
        
        
        if text == ""{
            switch textField{
            case otpDigit2:
                removeHighlightTextField(otpDigit2)
                otpDigit1.becomeFirstResponder()
                highlightTextField(otpDigit1)
            case otpDigit3:
                removeHighlightTextField(otpDigit3)
                otpDigit2.becomeFirstResponder()
                highlightTextField(otpDigit2)
            case otpDigit4:
                removeHighlightTextField(otpDigit4)
                otpDigit3.becomeFirstResponder()
                highlightTextField(otpDigit3)
            case otpDigit5:
                removeHighlightTextField(otpDigit5)
                otpDigit4.becomeFirstResponder()
                highlightTextField(otpDigit4)
            case otpDigit6:
                removeHighlightTextField(otpDigit6)
                otpDigit5.becomeFirstResponder()
                highlightTextField(otpDigit5)
            default:
                break
            }
        }
        
        if text?.utf16.count ?? 0 >= 1{
            switch textField{
            case otpDigit1:
                otpDigit1.textColor = UIColor.black
                if(otpDigit1.text?.count==2){
                    let char = otpDigit1.text!
                    otpDigit1.text = String(char.suffix(1))
                }
//                removeHighlightTextField(otpDigit1)
                otpDigit2.becomeFirstResponder()
                highlightTextField(otpDigit2)
            case otpDigit2:
                otpDigit2.textColor = UIColor.black
                if(otpDigit2.text?.count==2){
                    let char = otpDigit2.text!
                    otpDigit2.text = String(char.suffix(1))
                }
//                removeHighlightTextField(otpDigit2)
                otpDigit3.becomeFirstResponder()
                highlightTextField(otpDigit3)
            case otpDigit3:
                otpDigit3.textColor = UIColor.black
                if(otpDigit3.text?.count==2){
                    let char = otpDigit3.text!
                    otpDigit3.text = String(char.suffix(1))
                }
//                removeHighlightTextField(otpDigit3)
                otpDigit4.becomeFirstResponder()
                highlightTextField(otpDigit4)
            case otpDigit4:
                
                otpDigit4.textColor = UIColor.black
                if(otpDigit4.text?.count==2){
                    let char = otpDigit4.text!
                    otpDigit4.text = String(char.suffix(1))
                }
//                removeHighlightTextField(otpDigit4)
                otpDigit5.becomeFirstResponder()
                highlightTextField(otpDigit5)
            case otpDigit5:
                otpDigit5.textColor = UIColor.black
                if(otpDigit5.text?.count==2){
                    let char = otpDigit5.text!
                    otpDigit5.text = String(char.suffix(1))
                }
//                removeHighlightTextField(otpDigit5)
                otpDigit6.becomeFirstResponder()
                highlightTextField(otpDigit6)
            case otpDigit6:
                otpDigit6.textColor = UIColor.black
                if(otpDigit6.text?.count==2){
                    let char = otpDigit6.text!
                    otpDigit6.text = String(char.suffix(1))
                }
                otpDigit6.becomeFirstResponder()
                highlightTextField(otpDigit6)
            default:
                break
            }
        }else{
        }
    }
    
    func highlightTextField(_ textField: UITextField){
//        removeHighlightTextField(otpDigit1)
//        removeHighlightTextField(otpDigit2)
//        removeHighlightTextField(otpDigit3)
//        removeHighlightTextField(otpDigit4)
//        removeHighlightTextField(otpDigit5)
//        removeHighlightTextField(otpDigit6)
        
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 4
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
    }
    
    func removeHighlightTextField(_ textField: UITextField){
        textField.layer.borderWidth = 0
    }
    
    
    @IBAction func resendCodeButton(_ sender: Any) {
        startTimerForResendButton()
        
        if(!emailOrNumber.contains("@"))
        {
            FirebaseFunctions().sendVerificationCode(to: "\(countryCode)\(emailOrNumber)") { success in
                
                if(success){
                    Helpers().presentAlertBox("Code sent successfully", self)
                }
            }
        }
    }
    
    func startTimerForResendButton(){
        resendCodeButton.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateButtonLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateButtonLabel(){
        if (timeToResend <= 0){
            timeToResend = 60
            resendCodeButton.isEnabled = true
            timer.invalidate()
            
        }else{
            timeToResend -= 1
            if (timeToResend != 0) {
                resendCodeButton.titleLabel?.text = String(format: "00:%02d", timeToResend)
            }
        }
    }
    
    
}
