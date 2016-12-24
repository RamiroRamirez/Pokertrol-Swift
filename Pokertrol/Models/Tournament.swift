//
//  Tournament.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 23/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import Foundation
import RealmSwift

class Tournament: Object {

	dynamic var modality		: String?
	dynamic var type			: String?
	dynamic var buyIn 			: Double = 0
	dynamic var rebuys 			: Double = 0
	dynamic var numberOfPlayers : Int = 0
	dynamic var place 			: Int = 0
	dynamic var earnings 		: Double = 0

	func fillInformation(modality: String?, type: String?, buyIn: Double, rebuys: Double, numberOfPlayers: Int, place: Int, earnings: Double) {
		
		self.modality = modality
		self.type = type
		self.buyIn = buyIn
		self.rebuys = rebuys
		self.numberOfPlayers = numberOfPlayers
		self.place = place
		self.earnings = earnings
	}
}
