//
//  TopRatedTableViewCell.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import FoldingCell
import Kingfisher
import Cosmos
import PassKit

/// For setting up the TopRatedVC
class TopRatedTableViewCell: FoldingCell {
    
    // MARK: - Variables
    let paymentHandler = PaymentManager()
    var productForApplePay = Product()
    var button: UIButton?
    
    // MARK: - IBOutlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var shortDescription: UITextView!
    @IBOutlet weak var longDescription: UITextView!
    @IBOutlet weak var topRatedLabel: UILabel!
    @IBOutlet weak var productImageUnFold: UIImageView!
    @IBOutlet weak var productPriceUnFold: UILabel!
    @IBOutlet weak var firstContainerView: UIView!
    
    // MARK: - Functions
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
    
    func configureCell(product: Product) {
        productForApplePay = product
        self.productNameLabel.text = product.productName ?? "Not Available"
        self.productPriceLabel.text = product.price ?? "N/A"
        self.shortDescription.text = (product.shortDescription ?? "Not available.").html2String
        self.longDescription.text = (product.longDescription ?? "Not available.").html2String
        self.topRatedLabel.layer.cornerRadius = 8
        self.productPriceUnFold.text = product.price ?? "N/A"
        self.shortDescription.isEditable = false
        self.longDescription.isEditable = false
        
        if let inStock = product.inStock, inStock {
            self.inStockLabel.text = IN_STOCK
            self.inStockLabel.textColor = ColorPalette.Green.Medium
        } else {
            self.inStockLabel.text = OUT_OF_STOCK
            self.inStockLabel.textColor = ColorPalette.Red.Medium
            self.shippingLabel.textColor = ColorPalette.White.Medium
        }
        
        let image = UIImage(named: LOADING_IMAGE)
        guard let url = product.productImage else { return }
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: url, placeholder: image)
            self.productImageUnFold.kf.setImage(with: url, placeholder: image)
        }
        
        /// For Apple Pay
        let result = PaymentManager.applePayStatus()
        if result.canMakePayments {
            button =  PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)
            button?.addTarget(self, action: #selector(TopRatedTableViewCell.payPressed(sender:)), for: .touchUpInside)
        } else if result.canSetupCards {
            button =  PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
            button?.addTarget(self, action: #selector(TopRatedTableViewCell.setupPressed), for: .touchUpInside)
        }
    
        if button != nil {
            guard let buttonWidth = button?.frame.width else { return }
            guard let buttonHeight = button?.frame.height else { return }
            button?.frame = CGRect(x: 140, y: 75, width: buttonWidth, height: buttonHeight)
            firstContainerView.addSubview(button!)
        }
    }
    
    /// For Apple Pay to start the payment process
    @objc func payPressed(sender: AnyObject) {
        paymentHandler.startPayment(product: productForApplePay) { (success) in
            if success {
                print("Made it through payment!")
                // self.performSegue(withIdentifier: "Confirmation", sender: self)
            } else {
                
            }
        }
    }
    
    /// For Apple pay if Apple Pay is not set up
    @objc func setupPressed(sender: AnyObject) {
        let passLibrary = PKPassLibrary()
        passLibrary.openPaymentSetup()
    }
}
