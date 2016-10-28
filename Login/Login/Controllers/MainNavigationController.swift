//
//  MainNavigationController.swift
//  Login
//
//  Created by Dulio Denis on 10/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(presentLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    
    func presentLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
