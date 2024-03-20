//
//  Helpers.swift
//  loginProject
//
//  Created by Ground 2 on 19/03/24.
//

import Foundation
import UIKit

struct Helpers{
    func presentAlertBox(_ message : String, _ controller : UIViewController){
        let alert = UIAlertController(title: "Warning!", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        controller.present(alert, animated: true)
    }
    
}
