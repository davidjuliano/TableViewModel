// TODO: finish datasource protocol
// TODO: finish delegate protocol

import UIKit

open class TableViewModel: NSObject, TableViewModelType {
	@IBOutlet public var tableView: UITableView!
	public var sections: [TableViewSection] = []
	public var onSelect: TableViewRowSelectAction? = .none
	public var onDeselect: TableViewRowSelectAction? = .none
}

extension TableViewModel: UITableViewDataSource {
	public func numberOfSections(in tableView: UITableView) -> Int {
		return numberOfSections
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfRows(in: section)
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cell(in: tableView, at: indexPath)
	}
	
	public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sections[section].headerTitle
	}
	
	public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return sections[section].footerTitle
	}
	
	public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return .none
	}
	
	public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
		return 0
	}
	
	public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].canEdit
	}
}

extension TableViewModel: UITableViewDelegate {
	//
	// Configuring Rows for the Table View
	
//	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {}
	
	public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return self[indexPath].estimatedHeight
	}
	
	public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
		return self[indexPath].indentationLevel
	}
	
//	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {}
	
	
	
	//
	// Managing Accessory Views
	
	public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		return self[indexPath].rowActions
	}
	
//	func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {}
	
	
	
	//
	// Managing Selections
	
//	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {}
	
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let row = self[indexPath]
		row.onSelect?(indexPath)
		onSelect?(indexPath)
	}
	
//	func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {}
	
	public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		let row = self[indexPath]
		row.onDeselect?(indexPath)
		onDeselect?(indexPath)
	}
	
	
	
	//
	// Managing Table View Focus
	
	public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
		return self[indexPath].canFocus
	}
	
//	func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {}
	
//	func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {}
	
//	func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {}
}
