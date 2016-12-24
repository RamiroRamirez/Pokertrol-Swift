//
//  PTTournamentMakerViewController.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 24/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit

class PTTournamentMakerViewController: UIViewController {

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
