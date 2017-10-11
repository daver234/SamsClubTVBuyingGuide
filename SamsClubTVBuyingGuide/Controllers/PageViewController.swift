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
    var pageWithTV: Int?
    var productNumberInPage: Int?
    var cellNumber = 0
    

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
            cellNumber -= 1
            return getViewControllerAtIndex(index: index - 1)
        }
        return nil
    }
    
    /// Set up next view controller with correct content
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? DetailPageContentVC,
            let index = viewController.productInPage,
            (index + 1) < DataManager.instance.totalProductsRetrieved {
            cellNumber += 1
            return getViewControllerAtIndex(index: index + 1)
        }
        return nil
    }
    
    /// Set up view controller that will load with correct content
    func getViewControllerAtIndex(index: Int) -> DetailPageContentVC? {
        guard let storyboard = storyboard, let pageContentVC = storyboard.instantiateViewController(withIdentifier: DETAIL_PAGE_CONTENT) as? DetailPageContentVC, var currentPage = pageWithTV else { return DetailPageContentVC() }
        guard let products = DataManager.instance.allProducts[currentPage].products else {
            return UIViewController() as? DetailPageContentVC
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

        /// If coming to the end of products on this page, need to make sure more data has been fetched
        if index == 26 {
            ShowAllTvsTableVC().fetchMoreData(maxIndex: cellNumber, currentPage: currentPage)
        }
        /// If at end of products on current page, increment the page
        if index == 29 {
            pageContentVC.productInPage = 0
            currentPage += 1
            return pageContentVC
        }
        pageContentVC.productInPage = index
        return pageContentVC
    }

}
