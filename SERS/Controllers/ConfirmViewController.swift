//
//  ConfirmViewController.swift
//  SERS
//
//  Created by Noah Nemec on 10/11/21.
//

import UIKit

class ConfirmViewController: UIViewController {
	
	override func viewDidLoad() {
	  super.viewDidLoad()

	  let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
	  button.backgroundColor = .green
	  button.setTitle("Test Button", for: .normal)
	  button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

	  self.view.addSubview(button)
	}

	@objc func buttonAction(sender: UIButton!) {
	  print("Button tapped")
	}

}
