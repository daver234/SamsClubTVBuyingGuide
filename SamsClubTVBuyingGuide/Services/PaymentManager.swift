//
//  PaymentManager.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/29/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//
//  Adapted from Apple's Apple Pay Example
//
import Foundation

import UIKit
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

/// For Apple Pay
class PaymentManager: NSObject {
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .discover,
        .masterCard,
        .visa
    ]
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    class func applePayStatus() -> (canMakePayments: Bool, canSetupCards: Bool) {
        return (PKPaymentAuthorizationController.canMakePayments(),
                PKPaymentAuthorizationController.canMakePayments(usingNetworks: supportedNetworks));
    }
    
    func startPayment(product: Product, completion: @escaping PaymentCompletionHandler) {
        
        /// Need to take out the $ from the price field or Apple Pay will reject it.
        /// Apple Pay will add back the $ sign.
        /// Tax number is a placeholder.  Ideally do a calculation.
        guard let digits = product.price else { return }
        let index4 = digits.index(digits.startIndex, offsetBy: 1)
        let cleanPrice = String(digits[index4...])
        
        let tv = PKPaymentSummaryItem(label: "New TV", amount: NSDecimalNumber(string: cleanPrice), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "0.00"), type: .final)
        let total = PKPaymentSummaryItem(label: "Sams Club", amount: NSDecimalNumber(string: cleanPrice), type: .pending)
        
        paymentSummaryItems = [tv, tax, total]
        print("paymentSummaryItems",paymentSummaryItems)
        completionHandler = completion
        
        // Create our payment request
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = APPLE_MERCHENT_ID
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = PaymentManager.supportedNetworks
        
        // Display our payment request
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { (presented: Bool) in
            if presented {
                NSLog("Presented payment controller")
            } else {
                NSLog("Failed to present payment controller")
                self.completionHandler!(false)
            }
        })
    }
}


/// PKPaymentAuthorizationControllerDelegate conformance.
extension PaymentManager: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        
        // Perform some very basic validation on the provided contact information
        if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
            paymentStatus = .failure
        } else {
            paymentStatus = .success
        }
        
        completion(paymentStatus)
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    self.completionHandler!(true)
                } else {
                    self.completionHandler!(false)
                }
            }
        }
    }
}
