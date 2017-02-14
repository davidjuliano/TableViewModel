//
//  TableViewModel.swift
//  Glimpse
//
//  Created by David Juliano on 10/21/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

// TODO: finish datasource protocol
// TODO: finish delegate protocol

import UIKit

class TableViewModel: NSObject, TableViewModelType {
	@IBOutlet var tableView: UITableView!
	var sections: [TableViewSection] = []
	var onSelect: TableViewRowSelectAction? = .none
	var onDeselect: TableViewRowSelectAction? = .none
}

extension TableViewModel: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return numberOfSections
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfRows(in: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cell(in: tableView, at: indexPath)
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].headerTitle
	}
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return sections[section].footerTitle
	}
	
	func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return .none
	}
	
	func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].canEdit
	}
}

extension TableViewModel: UITableViewDelegate {
	//
	// Configuring Rows for the Table View
	
//	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return self[indexPath].estimatedHeight
	}
	
	func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
		return self[indexPath].indentationLevel
	}
	
//	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
	
	
	
	//
	// Managing Accessory Views
	
	func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		return self[indexPath].rowActions
	}
	
//	func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {}
	
	
	
	//
	// Managing Selections
	
//	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let row = self[indexPath]
		row.onSelect?(indexPath)
		onSelect?(indexPath)
	}
	
//	func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let row = self[indexPath]
		row.onDeselect?(indexPath)
		onDeselect?(indexPath)
	}
	
	
	
	//
	// Managing Table View Focus
	
	func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].canFocus
	}
	
//	func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {}
	
//	func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {}
	
//	func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {}
}
