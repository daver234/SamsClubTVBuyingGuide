//
//  NoConnectivityVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

/// Directs user to Settings to check for network connectivity
class NoConnectivityVC: UIViewController {
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Takes user to Settings
    @IBAction func settingsBtnTapped(_ sender: Any) {
        UIApplication.shared.open(URL.init(string: "App-Prefs:root=General")!, options: [:]) { (success) in
            /// If successful, dismiss this view controller to go back to the main view, StartVC
            self.dismiss(animated: true, completion: nil)
        }
    }
}
