//
//  TableViewSelection.swift
//  Glimpse
//
//  Created by David Juliano on 10/24/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

import Foundation

struct TableViewSelection {
	fileprivate(set) var indexPaths: Set<IndexPath> = Set()
	
	func isItemSelectedAt(indexPath: IndexPath) -> Bool {
		return indexPaths.contains(indexPath)
	}
	
	mutating func deselect(at indexPath: IndexPath) {
		indexPaths.remove(indexPath)
	}
	
	mutating func select(at indexPath: IndexPath) {
		indexPaths.insert(indexPath)
	}
}

//extension TableViewSelection: Collection {
//	var startIndex: Int { return indexPaths.startIndex }
//}

//extension MultipleSelection: Collection {
//	var startIndex: SetIndex<NSIndexPath> { return selectedIndexPaths.startIndex }
//	var endIndex: SetIndex<NSIndexPath> { return selectedIndexPaths.endIndex }
//	
//	func generate() -> SetGenerator<NSIndexPath> {
//		return selectedIndexPaths.generate()
//	}
//	
//	subscript(index: SetIndex<NSIndexPath>) -> NSIndexPath {
//		return selectedIndexPaths[index]
//	}
//}

//extension MultipleSelection: CustomStringConvertible {
//	var description:String {
//		var str = ""
//		for indexPath in selectedIndexPaths {
//			str += "\n\(indexPath)"
//		}
//		return str
//	}
//}
