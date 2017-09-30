//
//  TopRatedTableVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import FoldingCell
import PassKit

class TopRatedTableVC: UITableViewController {
    
    // MARK: - Variables
    let kCloseCellHeight: CGFloat = 130
    let kOpenCellHeight: CGFloat = 260
    fileprivate var cellHeights: [CGFloat] = []
    fileprivate var data = NetworkManager.instance.allProducts[0]

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        cellHeights = Array(repeating: kCloseCellHeight, count: PAGE_SIZE)
        tableView.estimatedRowHeight = kCloseCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}


extension TopRatedTableVC {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = data.products else { return 1 }
        return  products.count - 24
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TOP_RATED_CELL, for: indexPath) as! TopRatedTableViewCell
        guard let product = NetworkManager.instance.allProducts[0].products?[indexPath.row]  else {
            return UITableViewCell()
        }
        cell.configureCell(product: product)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as TopRatedTableViewCell = cell else {
            return
        }
        if cellHeights[indexPath.row] == kCloseCellHeight {
            cell.selectedAnimation(false, animated: false, completion:nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
    }
}
