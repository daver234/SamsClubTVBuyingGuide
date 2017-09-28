//
//  ViewController.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import SafariServices

class StartVC: UIViewController, SFSafariViewControllerDelegate {

    // MARK: - Variables
    let reachability = Reachability()!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Connection available to get data from API
        /// By loading products here we have avoid a delay when the user goes to view the list of products in ShowAllTvsTableVC
        NetworkManager.instance.getProductsForPage(pageNumber: STARTING_PAGE_NUMBER, pageSize: PAGE_SIZE) { (response) in
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// Watch for connectivity being turned off
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("could not start reachability notifier")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    /// Open Safari View Controller to view Tom's Guide to TV Buying
    @IBAction func tomsGuidBtnPressed(_ sender: Any) {
        guard let url = URL(string: TOMS_GUIDE) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
    
    /// When user taps Done button, Safari View Controller dismisses and returns to StartVC
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    /// Check for what state changed for connectivity
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
        case .cellular:
            print("Reachable via Cellular")
        case .none:
            let noConnection = NoConnectivityVC(nibName: "NoConnectivityVC", bundle: nil)
            self.present(noConnection, animated: true, completion: nil)
            print("Network not reachable")
        }
    }
}

