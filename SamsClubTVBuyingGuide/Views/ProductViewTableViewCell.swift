//
//  ProductViewTableViewCell.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

/// All the details of the cell in ShowAllTvsTableVC
class ProductViewTableViewCell: UITableViewCell {
    
    // IBOutlets - For Product
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var starView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(product: Product)  {
        self.productNameLabel.text = product.productName ?? "N/A"
        self.productPrice.text = product.price ?? "N/A"
        self.starView.rating = product.reviewRating ?? 0
        self.reviewCountLabel.text = "\(product.reviewCount ?? 0)"
        
        if let inStock = product.inStock, inStock {
            self.inStockLabel.text = IN_STOCK
            self.inStockLabel.textColor = ColorPalette.Green.Medium
        } else {
            self.inStockLabel.text = OUT_OF_STOCK
            self.inStockLabel.textColor = ColorPalette.Red.Medium
            self.shippingLabel.textColor = ColorPalette.White.Medium
        }
        
        /// Using Kingfisher Swift library to download and cache images
        /// Find it here: https://github.com/onevcat/Kingfisher
        ///
        /// First get image out of assets as a placeholder while downloading the image from a URL
        let image = UIImage(named: LOADING_IMAGE)
        guard let url = product.productImage else { return }
        DispatchQueue.main.async {
            self.productImage.kf.setImage(with: url, placeholder: image)
        }
    }
}

