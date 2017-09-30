//
//  FilterVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/29/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class FilterVC: UIViewController, UITableViewDelegate  {


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension FilterVC:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TYPE_OF_FILTER, for: indexPath) as? FilterTableViewCell else {
            return UITableViewCell()
        }
        cell.filterTypeLabel.text = filterType[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // cell selected code here
    }
    
}
