//
//  PTTournamentMakerViewController.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 24/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit
import DKHelper

enum TournamentOptions					: Int {

	case makerTitle = 0
	case modality
	case type
	case buyIn
	case reBuy
	case numberOfPlayers
	case place
	case earnings

	static func allValues() -> [TournamentOptions] {
		return [.makerTitle, .modality, .type, .buyIn, .reBuy, .numberOfPlayers, .place, .earnings]
	}

	func title() -> String {
		switch self {
		case .makerTitle				: return L("makerTitle")
		case .modality					: return L("modality")
		case .type						: return L("type")
		case .buyIn						: return L("buyIn")
		case .reBuy						: return L("reBuy")
		case .numberOfPlayers			: return L("numberOfPlayers")
		case .place						: return L("place")
		case .earnings					: return L("earnings")
		}
	}

	func placeholder() -> String {
		switch self {
		case .makerTitle				: return L("makerTitle.placeholder")
		case .modality					: return L("makerTitle.placeholder")
		case .type						: return L("type.placeholder")
		case .buyIn						: return L("buyIn.placeholder")
		case .reBuy						: return L("reBuy.placeholder")
		case .numberOfPlayers			: return L("numberOfPlayers.placeholder")
		case .place						: return L("place.placeholder")
		case .earnings					: return L("earnings.placeholders")
		}
	}

	func keyboardType() -> UIKeyboardType? {

		switch self {
		case .makerTitle				: return nil
		case .modality					: return nil
		case .type						: return nil
		case .buyIn, .reBuy, .earnings	: return .decimalPad
		case .numberOfPlayers, .place	: return .numberPad
		}
	}
}

class PTTournamentMakerViewController						: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var tableView					: UITableView?
	@IBOutlet private weak var tableViewBottomConstraint	: NSLayoutConstraint?
	@IBOutlet private weak var pickerViewHeightConstraint	: NSLayoutConstraint?
	@IBOutlet private weak var pickerBottomConstraint		: NSLayoutConstraint?

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
		let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap(_:)))
		self.view.addGestureRecognizer(tapRecognizer)
    }

	deinit {
		NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillShow)
		NotificationCenter.default.removeObserver(NSNotification.Name.UIKeyboardWillHide)
	}

	// MARK: - Helpers

	func endEditing() {
		self.view.endEditing(true)
	}

	func togglePickerView(show: Bool) {
		self.pickerBottomConstraint?.constant = ((show == true) ? 0 : -150)
		UIView.animate(withDuration: 0.3) { 
			self.view.layoutIfNeeded()
		}
	}

	func didTap(_ sender: UITapGestureRecognizer) {
		self.togglePickerView(show: false)
		self.view.endEditing(true)
	}

	func keyboardWillShow(notification: NSNotification) {
		if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
			self.tableViewBottomConstraint?.constant = keyboardSize.height
		}
	}


	func keyboardWillHide(notification: NSNotification) {
		self.tableViewBottomConstraint?.constant = 0
	}

	// MARK: - Actions

	@IBAction private func cancelButtonPressed(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction private func doneButtonPressed(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
}

// MARK: - Table View Methods

extension PTTournamentMakerViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return TournamentOptions.allValues().count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		func titleCell() -> PTTournamentMakerTitleCell {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tournamentMakerTitleCell.rawValue) as? PTTournamentMakerTitleCell else {
				return PTTournamentMakerTitleCell()
			}
			cell.setupCell()
			return cell
		}

		func optionCell(menuOption: TournamentOptions) -> PTTournamentMakerOptionCell {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tournamentMakerOptionCell.rawValue) as? PTTournamentMakerOptionCell else {
				return PTTournamentMakerOptionCell()
			}
			cell.setupCell(menuOption: menuOption, endEditingBlock: self.endEditing, togglePickerViewBlock: self.togglePickerView)
			return cell
		}

		guard let menu = TournamentOptions(rawValue: indexPath.row) else {
			return UITableViewCell()
		}

		switch menu {
		case .makerTitle:			return titleCell()
		case .modality,
		     .type,
		     .buyIn,
		     .reBuy,
		     .numberOfPlayers,
		     .place,
		     .earnings:				return optionCell(menuOption: menu)
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return CellHeights.tournamentMakerCells
	}
}
