//
//  ShowAllTvsTableVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class ShowAllTvsTableVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 0.7882352941, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}





extension ShowAllTvsTableVC {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let page = NetworkManager.instance.allProducts[0].products?.count  else { return 0 }
        
        print("in tableview, total count", page)
        return page
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PRODUCT_CELL, for: indexPath) as? ProductViewTableViewCell else {
            return UITableViewCell()
        }
        
        guard let product = NetworkManager.instance.allProducts[0].products?[indexPath.row]  else {
            return UITableViewCell()
        }
        
        cell.configureCell(product: product)
        // ProductViewTableViewCell().configureCell(product: page)
        return cell
    }
    
    /// Add spinner at bottom of table view when loading more data from the API call
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
        }
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
