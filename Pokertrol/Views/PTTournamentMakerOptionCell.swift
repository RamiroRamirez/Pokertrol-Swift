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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
