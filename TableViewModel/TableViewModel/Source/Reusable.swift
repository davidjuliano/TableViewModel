//
//  Reusable.swift
//  Glimpse
//
//  Created by David Juliano on 10/22/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

import UIKit

protocol Reusable: class {
	static var reuseIdentifier: String { get }
}

extension Reusable {
	static var reuseIdentifier: String { return String(describing: self) }
}

extension UITableViewCell: Reusable {}
