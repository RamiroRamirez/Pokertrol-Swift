//
//  PTPickerContainerView.swift
//  Pokertrol
//
//  Created by Ramiro Ramirez on 26/12/2016.
//  Copyright © 2016 ramram. All rights reserved.
//

import UIKit

enum PickerDataType: Int {

	case data = 0
	case date
}

class PTPickerContainerView						: UIView {

	// MARK: - Outlets

	@IBOutlet private weak var pickerView		: UIPickerView?
	@IBOutlet private weak var datePickerView	: UIDatePicker?
	@IBOutlet private weak var doneButton		: UIButton?

	// MARK: - View life cycle

	func setupPickerContainerView(pickerDataType: PickerDataType?, dataSourceForPicker: [String]? = nil) {

		self.datePickerView?.isHidden = (pickerDataType == .data)
	}

}
