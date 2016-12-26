	//
//  PTTournamentMakerOptionCell.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 24/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit

class PTTournamentMakerOptionCell					: UITableViewCell {

	// MARK: - Outlets

	@IBOutlet private weak var optionTitleLabel		: UILabel?
	@IBOutlet private weak var optionTextField		: UITextField?

	// MARK: - Variables

	var menuOption 									: TournamentOptions?
	var endEditingBlock								: (() -> Void)?
	var togglePickerViewBlock						: ((_ show: Bool) -> Void)?

    // MARK: - Cell Setup

	func setupCell(menuOption: TournamentOptions, endEditingBlock: (() -> Void)?, togglePickerViewBlock: ((_ show: Bool) -> Void)?) {
		self.optionTitleLabel?.text = menuOption.title()
		self.optionTextField?.placeholder = menuOption.placeholder()
		self.menuOption = menuOption
		self.endEditingBlock = endEditingBlock
		self.togglePickerViewBlock = togglePickerViewBlock
		if let _keyboardType = menuOption.keyboardType() {
			self.optionTextField?.keyboardType = _keyboardType
		}
		self.optionTextField?.delegate = self
	}
}

extension PTTournamentMakerOptionCell				: UITextFieldDelegate {

	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
 		if (self.menuOption?.keyboardType() == nil) {
			self.endEditingBlock?()
			// show data picker
			self.togglePickerViewBlock?(true)
			return false
		}
		return true
	}
}
