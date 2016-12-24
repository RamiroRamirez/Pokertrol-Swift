//
//  PTTournamentsViewController.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 23/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit
import RealmSwift

class PTTournamentsViewController			: UIViewController {

	// MARK: - Outlets

	@IBOutlet private weak var tableView	: UITableView?

	// MARK: - Variables

	var tournaments							: Results<Tournament>?

	// MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

		// fetch saved tournaments
		let realm = try! Realm()
		self.tournaments = realm.objects(Tournament.self)

		// refresh tableview
		self.tableView?.reloadData()

    }
}

// MARK: - Table View Methods

extension PTTournamentsViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (self.tournaments?.count ?? 0)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell()
		cell.textLabel?.text = self.tournaments?[indexPath.row].modality
		return cell
	}
}
