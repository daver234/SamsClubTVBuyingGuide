//
//  Extensions.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

/// Used to take out the highlighting of the selected row
extension UITableView {
    public func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}

/// Used to convert HTML to String
extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
