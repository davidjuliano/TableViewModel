//
//  TableViewSection.swift
//  Glimpse
//
//  Created by David Juliano on 10/22/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

// TODO: header and footer views

import UIKit

open struct TableViewSection {
	var rows: [TableViewRow] = []
	var headerTitle: String? = .none
	var footerTitle: String? = .none
	
	init(rows: [TableViewRow], headerTitle: String? = .none, footerTitle: String? = .none) {
		self.rows = rows
		self.headerTitle = headerTitle
		self.footerTitle = footerTitle
	}
}

public extension TableViewSection {
	subscript(idx: Int) -> TableViewRow {
		get { return rows[idx] }
		set { rows[idx] = newValue }
	}
	
	var numberOfRows: Int { return rows.count }
	
	func cell(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
		let row = rows[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: row.rowIdentifier, for: indexPath)
		row.configure(cell: cell)
		return cell
	}
}
