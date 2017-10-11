//
//  ProductDetailPageVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/9/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // MARK: - Variables
    var pageWithTV = 0
    var productNumberInPage: Int!

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.navigationController?.navigationBar.tintColor = ColorPalette.White.Medium
        
        if let viewController = getViewControllerAtIndex(index: productNumberInPage ?? 0) {
            let viewControllers = [viewController]
            setViewControllers(
                viewControllers,
                direction: .forward,
                animated: false,
                completion: nil
            )
        }
    }
    
    /// Set up previous view controller with correct content
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? DetailPageContentVC,
            let index = viewController.productInPage,
            index > 0 {
            return getViewControllerAtIndex(index: index - 1)
        }
        return nil
    }
    
    /// Set up next view controller with correct content
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? DetailPageContentVC,
            let index = viewController.productInPage,
            (index + 1) < DataManager.instance.totalProductsRetrieved {
            return getViewControllerAtIndex(index: index + 1)
        }
        return nil
    }
    
    /// Set up view controller that will load with correct content
    func getViewControllerAtIndex(index: Int) -> DetailPageContentVC? {
        guard let storyboard = storyboard, let pageContentVC = storyboard.instantiateViewController(withIdentifier: DETAIL_PAGE_CONTENT) as? DetailPageContentVC else { return DetailPageContentVC() }
        guard let products = DataManager.instance.allProducts[pageWithTV].products else {
            return UIViewController() as! DetailPageContentVC
        }

        pageContentVC.productImageURL = products[index].productImage
        pageContentVC.productNameTitle = products[index].productName ?? "N/A"
        pageContentVC.reviewRating = products[index].reviewRating ?? 0.0
        pageContentVC.reviewCount = "\(products[index].reviewCount ?? 0)"
        pageContentVC.price = products[index].price ?? "N/A"
        pageContentVC.shortDescribe = (products[index].shortDescription ?? "Not available.").html2String
        pageContentVC.longDescribe = (products[index].longDescription ?? "Not available.").html2String
        
        if let inStock = products[index].inStock, inStock {
            pageContentVC.inStock = IN_STOCK
            pageContentVC.freeShiping = FREE_SHIPPING
        } else {
            pageContentVC.inStock = OUT_OF_STOCK
        }
        
        pageContentVC.productInPage = index
        return pageContentVC
    }

}
