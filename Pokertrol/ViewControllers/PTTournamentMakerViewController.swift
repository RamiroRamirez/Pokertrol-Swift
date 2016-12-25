//
//  PTTournamentMakerViewController.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 24/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit
import DKHelper

enum TournamentOptions			: Int {

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
		case .makerTitle		: return L("")
		case .modality			: return L("")
		case .type				: return L("")
		case .buyIn				: return L("")
		case .reBuy				: return L("")
		case .numberOfPlayers	: return L("")
		case .place				: return L("")
		case .earnings			: return L("")
		}
	}

	func placeholder() -> String {
		switch self {
		case .makerTitle		: return L("")
		case .modality			: return L("")
		case .type				: return L("")
		case .buyIn				: return L("")
		case .reBuy				: return L("")
		case .numberOfPlayers	: return L("")
		case .place				: return L("")
		case .earnings			: return L("")
		}
	}

}

class PTTournamentMakerViewController		: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var tableView	: UITableView?

	// MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Actions

	@IBAction func cancelButtonPressed(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction func doneButtonPressed(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
}

// MARK: - Table View Methods

extension PTTournamentMakerViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
