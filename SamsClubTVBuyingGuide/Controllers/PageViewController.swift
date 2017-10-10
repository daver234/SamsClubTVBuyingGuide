//
//  ProductDetailPageVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/9/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    //var currentIndex: Int!
    // MARK: - Variables
    var pageWithTV = 0
    var productNumberInPage = 0

    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.navigationController?.navigationBar.tintColor = ColorPalette.White.Medium
        self.setViewControllers([getViewControllerAtIndex(index: 0)] as [DetailPageContentVC], direction: .forward, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: DetailPageContentVC = viewController as! DetailPageContentVC
        var index = pageContent.pageViewIndex
        if ((index == 0) || (index == NSNotFound)) {
            return nil
        }
        index -= 1
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: DetailPageContentVC = viewController as! DetailPageContentVC
        var index = pageContent.pageViewIndex
        if (index == NSNotFound) {
            return nil
        }
        index += 1
        if (index == PAGE_SIZE) {
            return nil
        }
        return getViewControllerAtIndex(index: index)
    }
    
    func getViewControllerAtIndex(index: NSInteger) -> DetailPageContentVC {

        let pageContentViewController = self.storyboard?.instantiateViewController(withIdentifier: DETAIL_PAGE_CONTENT) as! DetailPageContentVC
        
        guard let products = DataManager.instance.allProducts[pageWithTV].products else {
            return UIViewController() as! DetailPageContentVC
        }

        pageContentViewController.productImageURL = products[productNumberInPage].productImage
        pageContentViewController.productNameTitle = products[productNumberInPage].productName ?? "N/A"
        pageContentViewController.pageViewIndex = index
        productNumberInPage += 1
        return pageContentViewController
    }

}
