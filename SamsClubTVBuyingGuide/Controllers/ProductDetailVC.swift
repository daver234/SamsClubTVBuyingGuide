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
class ProductDetailVC: UIViewController, UINavigationControllerDelegate {

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
    @IBOutlet weak var shortDescription: UITextView!
    @IBOutlet weak var longDescription: UITextView!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = ColorPalette.White.Medium
        print("variables", pageWithTV, productNumberInPage)
        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        recognizer.direction = .left
        self.view.addGestureRecognizer(recognizer)
        self.navigationController?.delegate = self
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        print("in here again")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// Set status bar back to default because inital view is white so we need a dark color (default)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

    func setUpView() {
        guard let products = DataManager.instance.allProducts[pageWithTV].products else { return }
        productNameLabel.text = products[productNumberInPage].productName ?? "N/A"
        self.reviewRatingLabel.rating = products[productNumberInPage].reviewRating ?? 0.0
        reviewCountLabel.text = "\(products[productNumberInPage].reviewCount ?? 0)"
        priceLabel.text = products[productNumberInPage].price ?? "N/A"
        
        shortDescription.text = (products[productNumberInPage].shortDescription ?? "Not available.").html2String
        longDescription.text = (products[productNumberInPage].longDescription ?? "Not available.").html2String
        
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
        print("Add to cart button pressed")
    }
    
    @objc func handleSwipe(recognizer : UISwipeGestureRecognizer) {
        /// A quick implementation. Maybe implement a pageviewcontrolller
        /// Only works for current page.
        /// To improve, at a minumum, need to check for how many items in DataManager
        /// to see if more pages are there and if not load more.
        /// For now, just swiping for products on current page (30 products per page).
        print("swipe left...I heard you", productNumberInPage)
        guard productNumberInPage != (PAGE_SIZE - 1) else {
            print("Sorry out of products on this page. Go back to list view")
            return
        }
        
        productNumberInPage += 1
        
        /// Animate the data update so user gets a sense that the data changed.
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            self.setUpView()
        }, completion: nil)
    }
}


