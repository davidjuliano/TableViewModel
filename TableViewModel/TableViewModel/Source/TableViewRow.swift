//
//  TableViewRow.swift
//  Glimpse
//
//  Created by David Juliano on 10/22/16.
//  Copyright © 2016 WashSqParkTeam. All rights reserved.
//

// TODO: add properties as necessary to fill out UITableViewDelegate
//		 protocol on TableViewModel

import UIKit

typealias TableViewRowSelectAction = (IndexPath) -> ()

protocol TableViewRow {
	var rowIdentifier: String { get }
	func configure(cell: UITableViewCell)
	
	var rowActions: [UITableViewRowAction]? { get set }
	var canEdit: Bool { get set }
	var canFocus: Bool { get set }
	var onSelect: TableViewRowSelectAction? { get set }
	var onDeselect: TableViewRowSelectAction? { get set }
	var indentationLevel: Int { get set }
	var estimatedHeight: CGFloat { get }
}

extension TableViewRow {
	func configure(cell: UITableViewCell) {}
	
	var rowActions: [UITableViewRowAction]? {
		get { return .none }
		set {}
	}
	
	var canEdit: Bool {
		get {
			guard let actions = rowActions else { return false }
			return actions.count > 0
		}
		set {}
	}
	
	var canFocus: Bool {
		get { return false }
		set {}
	}
	
	var onSelect: ((IndexPath) -> ())? {
		get { return .none }
		set {}
	}
	
	var onDeselect: ((IndexPath) -> ())? {
		get { return .none }
		set {}
	}
	
	var indentationLevel: Int {
		get { return 0 }
		set {}
	}
	
	var estimatedHeight: CGFloat {
		get { return UITableViewAutomaticDimension }
	}
}
