//
//  Link+CoreDataProperties.swift
//  DBKit
//
//  Created by Sam on 14/08/18.
//  Copyright © 2018 Orange. All rights reserved.
//
//

import Foundation
import CoreData

extension Link {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Link> {
        return NSFetchRequest<Link>(entityName: "Link")
    }

    @NSManaged public var title: String
    @NSManaged public var address: String?
    @NSManaged public var desc: String?

}
