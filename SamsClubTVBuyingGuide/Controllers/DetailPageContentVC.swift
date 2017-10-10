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
    var pageWithTV = 0
    var productNumberInPage = 0
    var pageViewIndex = 0
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    var productImageURL: URL!
    var productNameTitle: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let image = UIImage(named: LOADING_IMAGE)
        let url = productImageURL
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: url, placeholder: image)
        }
        productName.text = productNameTitle
        // setUpView()
        
    }
    
    func setUpView() {
        guard let products = DataManager.instance.allProducts[pageWithTV].products else { return }
        productName.text = products[productNumberInPage].productName ?? "N/A"
        //self.reviewRatingLabel.rating = products[productNumberInPage].reviewRating ?? 0
        //reviewCountLabel.text = "\(products[productNumberInPage].reviewCount ?? 0)"
        //priceLabel.text = products[productNumberInPage].price ?? "N/A"
        
        //shortDescription.text = (products[productNumberInPage].shortDescription ?? "Not available.").html2String
        //longDescription.text = (products[productNumberInPage].longDescription ?? "Not available.").html2String
        
        /*
        if let inStock = products[productNumberInPage].inStock, inStock {
            inStockLabel.text = IN_STOCK
            inStockLabel.textColor = ColorPalette.Green.Medium
        } else {
            inStockLabel.text = OUT_OF_STOCK
            inStockLabel.textColor = ColorPalette.Red.Medium
            freeShippingLabel.textColor = ColorPalette.White.Medium
        }
 */
        
        /// Using Kingfisher Swift library to download and cache images
        /// Find it here: https://github.com/onevcat/Kingfisher
        ///
        /// First get image out of assets as a placeholder while downloading the image from a URL
        let image = UIImage(named: LOADING_IMAGE)
        guard let url = products[productNumberInPage].productImage else { return }
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: url, placeholder: image)
        }
    }
}
