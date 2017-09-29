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

/*
 PKPaymentAuthorizationControllerDelegate conformance.
 */
extension PaymentManager: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        
        // Perform some very basic validation on the provided contact information
        if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
            paymentStatus = .failure
        } else {
            // Here you would send the payment token to your server or payment provider to process
            // Once processed, return an appropriate status in the completion handler (success, failure, etc)
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
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didSelectPaymentMethod paymentMethod: PKPaymentMethod, completion: @escaping ([PKPaymentSummaryItem]) -> Void) {
        // The didSelectPaymentMethod delegate method allows you to make changes when the user updates their payment card
        // Here we're applying a $2 discount when a debit card is selected
        if paymentMethod.type == .debit {
            var discountedSummaryItems = paymentSummaryItems
            let discount = PKPaymentSummaryItem(label: "Debit Card Discount", amount: NSDecimalNumber(string: "-2.00"))
            discountedSummaryItems.insert(discount, at: paymentSummaryItems.count - 1)
            if let total = paymentSummaryItems.last {
                total.amount = total.amount.subtracting(NSDecimalNumber(string: "5.00"))
            }
            completion(discountedSummaryItems)
        } else {
            completion(paymentSummaryItems)
        }
    }
}
