//
//  ProductDetailVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

/// Show the details of one product
class ProductDetailVC: UIViewController {

    // MARK: - Variables
    var pageWithTV = 0
    var productNumberInPage = 0
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = ColorPalette.White.Medium
        
        print("variables", pageWithTV, productNumberInPage)
    }
}
