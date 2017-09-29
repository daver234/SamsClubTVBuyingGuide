//
//  TopRatedTableVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import FoldingCell

class TopRatedTableVC: UITableViewController {
    
    fileprivate struct CellMeasure {
        struct CellHeight {
            static let close: CGFloat = 100 // equal or greater foregroundView height
            static let open: CGFloat = 250 // equal or greater containerView height
        }
    }
    
    var cellHeights = (0..<PAGE_SIZE).map { _ in CellMeasure.CellHeight.close }
    // let kRowsCount = 10
    //var cellHeights: [CGFloat] = []
    
    let data = MockDataManager.instance.allMockData[0]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TopRatedTableVC {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let products = data.products else { return 1 }
        return  products.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TOP_RATED, for: indexPath) as! TopRatedTableViewCell
        //let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        //cell.durationsForExpandedState = durations
        //cell.durationsForCollapsedState = durations
        guard let product = MockDataManager.instance.allMockData[0].products?[indexPath.row]  else {
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
        if cellHeights[indexPath.row] == CellMeasure.CellHeight.close { // open cell
            cellHeights[indexPath.row] = CellMeasure.CellHeight.open
            cell.selectedAnimation(true, animated: true, completion: nil)
            
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = CellMeasure.CellHeight.close
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
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
        
        cell.backgroundColor = .clear
        
        if cellHeights[indexPath.row] == CellMeasure.CellHeight.close {
            cell.selectedAnimation(false, animated: false, completion:nil)
        } else {
            cell.selectedAnimation(true, animated: false, completion: nil)
        }
        
        // cell.number = indexPath.row
    }
        

}
