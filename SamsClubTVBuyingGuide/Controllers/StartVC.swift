//
//  ViewController.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import SafariServices
import SwiftSpinner

class StartVC: UIViewController, SFSafariViewControllerDelegate {

    // MARK: - Variables
    let reachability = Reachability()!
    var isNetworkDone = false
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /// Watch for connectivity being turned off
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability.startNotifier()
        } catch {
            print("could not start reachability notifier")
        }
        
        /// Go get the data and load into NetworkManager singleton
        callAPI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
    
    // MARK: - IBActions
    
    /// Open Safari View Controller to view Tom's Guide to TV Buying
    @IBAction func tomsGuidBtnPressed(_ sender: Any) {
        guard let url = URL(string: TOMS_GUIDE) else { return }
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        self.present(safariVC, animated: true, completion: nil)
    }
    
    @IBAction func showAllTvsBtnPressed(_ sender: Any) {
        setSpinner(forView: SHOW_ALL_TVS, isNetworkingDone: isNetworkDone)
    }
    
    @IBAction func showTopRatedBtnPressed(_ sender: Any) {
        setSpinner(forView: TOP_RATED, isNetworkingDone: isNetworkDone)
    }
    
    /// Decide how to handle the spinner
    func setSpinner(forView: String, isNetworkingDone: Bool) {
        switch (forView, isNetworkingDone) {
        case (forView, true):
            SwiftSpinner.hide()
            performSegue(withIdentifier: forView, sender: nil)
            break
        case (forView, false):
            SwiftSpinner.show("Every TV on its way...")
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) { [weak self] in
                SwiftSpinner.hide()
                self?.performSegue(withIdentifier: forView, sender: nil)
            }
        default:
            break
        }
    }
    
    func callAPI() {
        NetworkManager.instance.getProductsForPage(pageNumber: STARTING_PAGE_NUMBER, pageSize: PAGE_SIZE) { [weak self] (response) in
            if response {
                // guard let strongSelf = self else { return }
                self?.isNetworkDone = true
                DispatchQueue.main.async {
                    SwiftSpinner.hide()
                }
            } else {
                print("Error in network manager response")
            }
        }
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

