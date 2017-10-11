//
//  DetailPageContentVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/9/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher
import WebKit

class DetailPageContentVC: UIViewController {
    
    // MARK: - Variables
    var productInPage: Int!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var reviewRatingLabel: CosmosView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!
    
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var shortDescription: UITextView!
    @IBOutlet weak var longDescription: UITextView!
    
    
    var productImageURL: URL!
    var productNameTitle: String!
    var reviewRating: Double!
    var reviewCount: String!
    var price: String!
    var freeShiping: String!
    var inStock: String!
    var shortDescribe: String!
    var longDescribe: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent

        let image = UIImage(named: LOADING_IMAGE)
        let url = productImageURL
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: url, placeholder: image)
        }
        productName.text = productNameTitle
        reviewRatingLabel.rating = reviewRating
        reviewCountLabel.text = reviewCount
        priceLabel.text = price
        freeShippingLabel.text = freeShiping
        inStockLabel.text = inStock
        shortDescription.text = shortDescribe
        longDescription.text = longDescribe
        
        if freeShippingLabel.text == FREE_SHIPPING {
            inStockLabel.textColor = ColorPalette.Green.Medium
        } else {
            inStockLabel.textColor = ColorPalette.Red.Medium
            freeShippingLabel.textColor = ColorPalette.White.Medium
        }
    }
}
