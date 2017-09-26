//
//  NoConnectivityVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class NoConnectivityVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func settingsBtnTapped(_ sender: Any) {
        // UIApplication.shared.open(URL(string:"App-Prefs:root=General")!, options: [:], completionHandler: nil)
        // UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
        
        /// Drop =General?
        UIApplication.shared.open(URL.init(string: "App-Prefs:root=General")!, options: [:]) { (success) in
            
        }
    }
}
