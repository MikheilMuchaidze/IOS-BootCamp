//
//  Car+CoreDataProperties.swift
//  CoreData_Keychain
//
//  Created by Vasili Baramidze on 24.08.22.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var model: String?
    @NSManaged public var maxSpeed: Int16
    @NSManaged public var manufacturer: NSSet?

}

// MARK: Generated accessors for manufacturer

extension Car {

    @objc(addManufacturerObject:)
    @NSManaged public func addToManufacturer(_ value: Manufacturer)

    @objc(removeManufacturerObject:)
    @NSManaged public func removeFromManufacturer(_ value: Manufacturer)

    @objc(addManufacturer:)
    @NSManaged public func addToManufacturer(_ values: NSSet)

    @objc(removeManufacturer:)
    @NSManaged public func removeFromManufacturer(_ values: NSSet)

}

extension Car : Identifiable {

}
