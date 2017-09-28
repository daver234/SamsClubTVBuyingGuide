//
//  ProductDetailVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import Cosmos
import WebKit

/// Show the details of one product
class ProductDetailVC: UIViewController {

    // MARK: - Variables
    var pageWithTV = 0
    var productNumberInPage = 0
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var reviewRatingLabel: CosmosView!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var shortDescription: WKWebView!
    @IBOutlet weak var longDescription: WKWebView!
    
    
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = ColorPalette.White.Medium
        print("variables", pageWithTV, productNumberInPage)
        setUpView()
    }

    func setUpView() {
        guard let products = NetworkManager.instance.allProducts[pageWithTV].products else { return }
        productNameLabel.text = products[productNumberInPage].productName ?? "N/A"
        reviewRatingLabel.rating = products[productNumberInPage].reviewRating ?? 0
        reviewCountLabel.text = "\(products[productNumberInPage].reviewCount ?? 0)"
        priceLabel.text = products[productNumberInPage].price ?? "N/A"
        
        let fontsForWebViewShort = "<font face='System' size='15' color= 'black'>" + (products[productNumberInPage].shortDescription ?? "Not available.")
        shortDescription.loadHTMLString(fontsForWebViewShort, baseURL: nil)
        // let longHtmlText = products[productNumberInPage].longDescription ?? "Not available."
        let fontsForWebViewLong = "<font face='System' size='15' color= 'black'>" + (products[productNumberInPage].longDescription ?? "Not available.")
        longDescription.loadHTMLString(fontsForWebViewLong, baseURL: nil)
        
        if let inStock = products[productNumberInPage].inStock, inStock {
            inStockLabel.text = IN_STOCK
            inStockLabel.textColor = ColorPalette.Green.Medium
        } else {
            inStockLabel.text = OUT_OF_STOCK
            inStockLabel.textColor = ColorPalette.Red.Medium
            freeShippingLabel.textColor = ColorPalette.White.Medium
        }
        
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
    
    @IBAction func buyBtnPressed(_ sender: Any) {
        
    }
}


