//
//  ConversationsViewController.swift
//  SERS
//
//  Created by Noah Nemec on 9/29/21.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
	
	


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		validateAuth()
		

	}
	private func validateAuth() {
		if FirebaseAuth.Auth.auth().currentUser === nil {
			let vc = LoginViewController()
			let nav = UINavigationController(rootViewController: vc)
			nav.modalPresentationStyle = .fullScreen
			present(nav, animated: false)
		}
	}
	
}

