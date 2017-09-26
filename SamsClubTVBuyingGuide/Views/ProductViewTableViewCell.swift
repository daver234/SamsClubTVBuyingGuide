//
//  ProductViewTableViewCell.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import Cosmos

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
            self.inStockLabel.textColor = ColorPalette.Green.Medium  // #colorLiteral(red: 0.3568627451, green: 0.5607843137, blue: 0.1333333333, alpha: 1)
        } else {
            self.inStockLabel.text = OUT_OF_STOCK
            self.inStockLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            self.shippingLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
        // self.reviewCountLabel.text = String(describing: product.reviewCount ?? 0)
        
        /// Getting the image to show
        /// Maybe implement image cache and pull from that?
        guard let url = product.productImage else { return }
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            
            /// Put image on main queue when received
            DispatchQueue.main.async {
                self.productImage.image = image
            }
        }
    }
}

