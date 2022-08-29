//
//  Manufacturer+CoreDataProperties.swift
//  CoreData_Keychain
//
//  Created by Vasili Baramidze on 24.08.22.
//
//

import Foundation
import CoreData


extension Manufacturer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manufacturer> {
        return NSFetchRequest<Manufacturer>(entityName: "Manufacturer")
    }

    @NSManaged public var city: String?
    @NSManaged public var address: String?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Manufacturer {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}

extension Manufacturer : Identifiable {

}
