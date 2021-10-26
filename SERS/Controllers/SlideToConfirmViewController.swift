//
//  SlideToConfirmViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/11/21.
//

import UIKit
//import MTSlideToOpen

class ViewController: UIViewController {
	private let emailField: UITextField = {
		let field = UITextField()
		field.autocapitalizationType = .none
		field.autocorrectionType = .no
		field.returnKeyType = .continue
		field.layer.cornerRadius = 12
		field.layer.borderWidth = 1
		field.layer.borderColor = UIColor.gray.cgColor
		field.placeholder = "Email Address..."
		
		field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
		field.leftViewMode = .always
		field.backgroundColor = .white
		field.textColor = .black
		return field
		
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(emailField)

	}
	
}
