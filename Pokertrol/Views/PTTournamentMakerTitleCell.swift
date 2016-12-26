//
//  PTTournamentMakerTitleCell.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 24/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit
import DKHelper

class PTTournamentMakerTitleCell			: UITableViewCell {

	// MARK: - Outlets

	@IBOutlet private weak var titleLabel	: UILabel?

    // MARK: - Setup Method

	func setupCell() {
		self.titleLabel?.text = L("Title.tournament.maker")
	}
}
