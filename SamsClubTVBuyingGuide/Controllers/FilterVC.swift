//
//  FilterVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/29/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class FilterVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// Quickly flash the vertical scroll bar in popover so user gets indicator that the table scrolls.
    /// Without this, it is not obvious that the table scrolls for more choices
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.flashScrollIndicators()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TYPE_OF_FILTER, for: indexPath) as? FilterTableViewCell else {
            return UITableViewCell()
        }
        cell.setupView(label: filterType[indexPath.row])
        return cell
    }
}
