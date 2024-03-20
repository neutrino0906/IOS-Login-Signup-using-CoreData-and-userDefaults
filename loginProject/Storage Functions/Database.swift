//
//  DatabaseFunctions.swift
//  loginProject
//
//  Created by Ground 2 on 20/03/24.
//

import Foundation
import UIKit
import CoreData

class Database{
    let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addToCoreData(name: String, email: String, phoneNumber: String) {
        
        let newData = UserModelEntity(context: ctx)
        newData.email = email
        newData.name = name
        newData.phoneNumber = phoneNumber
        
        do {
            try ctx.save()
            
        } catch {
            print("error-Saving data")
        }
    }
    
    func checkUserInCoreData(_ email: String) -> Bool {
        do {
            let fetchRequest : NSFetchRequest<UserModelEntity> = UserModelEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email == %@", email)
            
            let items = try ctx.fetch(fetchRequest)
            for item in items{
                return true
            }
            
        } catch {
            print("error-Fetching data")
            return false
        }
        return false
    }
    
    
    
}
