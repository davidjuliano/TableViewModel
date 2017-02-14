//
//  TableViewModelType.swift
//  Glimpse
//
//  Created by David Juliano on 10/22/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

import UIKit

public protocol TableViewModelType {
	var tableView: UITableView! { get }
	var sections: [TableViewSection] { get set }
	var onSelect: TableViewRowSelectAction? { get set }
	var onDeselect: TableViewRowSelectAction? { get set }
}

public extension TableViewModelType {
	subscript(idx: Int) -> TableViewSection {
		get { return sections[idx] }
		set { sections[idx] = newValue }
	}
	
	subscript(indexPath: IndexPath) -> TableViewRow {
		get { return sections[indexPath.section][indexPath.row] }
		set { sections[indexPath.section][indexPath.row] = newValue }
	}
	
	var numberOfSections: Int { return sections.count }
	
	func numberOfRows(in section: Int) -> Int { return sections[section].numberOfRows }
	
	func cell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
		return sections[indexPath.section].cell(in: tableView, at: indexPath)
	}
}
