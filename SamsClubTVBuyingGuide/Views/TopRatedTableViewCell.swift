//
//  TopRatedTableViewCell.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/28/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import FoldingCell
///

class TopRatedTableViewCell: FoldingCell {

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

}
