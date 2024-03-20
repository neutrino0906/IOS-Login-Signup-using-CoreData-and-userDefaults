//
//  UserModelEntity+CoreDataProperties.swift
//  loginProject
//
//  Created by Ground 2 on 20/03/24.
//
//

import Foundation
import CoreData


extension UserModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModelEntity> {
        return NSFetchRequest<UserModelEntity>(entityName: "UserModelEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNumber: String?

}

extension UserModelEntity : Identifiable {

}
