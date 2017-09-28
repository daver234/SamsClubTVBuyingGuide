//
//  ShowAllTvsTableVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import Kingfisher

/// A table view to show the results from calling the API
class ShowAllTvsTableVC: UITableViewController, UITableViewDataSourcePrefetching {
    
    // MARK: - Variables
    // var currentPage: Int = 1
    @IBOutlet weak var tableFooterView: UIView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = ColorPalette.Blue.Medium
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.tableView.prefetchDataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        UIApplication.shared.statusBarStyle = .lightContent
        
        /// Allows user to see what cell they came from after returning from ProductDetailVC
        /// This uses the UITableView extension in Extensions.swift
        self.tableView.deselectSelectedRow(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        /// Set status bar back to default because inital view is white so we need a dark color (default)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    /// Return to StartVC
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}



extension ShowAllTvsTableVC {
    
    // MARK: - TableView functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // print("&&&& number of rows means totalProductsRetrieved", NetworkManager.instance.totalProductsRetrieved)
        return NetworkManager.instance.totalProductsRetrieved
    }
    
    /// Use Apple and Kingfisher prefetching to download images ahead of time to improve the user experience.
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        /// First get the images
        // print("&&&& just before guard, subscript to All products is: ", (currentPage - 1))
        let currentPage = NetworkManager.instance.numberOfPagesRetrieved - 1
        guard let product = NetworkManager.instance.allProducts[currentPage].products  else {
            return
        }
        let urls = product.flatMap { $0.productImage }
        ImagePrefetcher(urls: urls).start()
        
        
        ////// Testing here
        /// Then get more data
        let upcomingRows = indexPaths.map { $0.row }
        
        if let maxIndex = upcomingRows.max() {
            
            // let nextPage: Int = Int(ceil(Double(maxIndex) / Double(PAGE_SIZE)))
            
            /// The maxIndex in the highest indexPath.row that is upcoming.
            /// Adding to maxIndex causes the API call to happen 5 cells sooner that where the spinner will show.
            /// This allows for time to get the data and reduce the amount of time the user sees the spinner.
            /// So in general, this should improve the user experience.
            let nextPage: Int = ( (maxIndex + 5) / PAGE_SIZE)
            print("&&& FIRST nextPage", nextPage)
//            print("Here is current page", currentPage)
            print("&&&&&& maxIndex", maxIndex)
//            print("here is upcoming rows", upcomingRows)
            
            if nextPage > currentPage {
                print("&&& in nextPage >", nextPage)
                print("&&& Here is current page", currentPage)
                print("&&& here is maxIndex", maxIndex)
                print("&&& here is upcoming rows", upcomingRows)
                print("done ShowAll -------------------")
                // Your function, which attempts to load respective page from the local database
                //loadLocalData(page: nextPage)
                
                // Check to see if we are done loading data.  Otherwise continue and make another API call
//                guard !NetworkManager.instance.isEndOfData else {
//                    print("&&& in isEndOfData")
//                    return
//                }
                
//                if NetworkManager.instance.isEndOfData {
//                    self.tableView.reload
//                }
                
                // Your function, which makes a network request to fetch the respective page of data from the network
                //startLoadingDataFromNetwork(page: nextPage
                let _ = "Here"
                NetworkManager.instance.getProductsForPage(pageNumber: nextPage, pageSize: PAGE_SIZE) { (response) in
                if response {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    print("&&& loaded all the data.  Done")
                }
                // self.currentPage = nextPage
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PRODUCT_CELL, for: indexPath) as? ProductViewTableViewCell else {
            return UITableViewCell()
        }
        
        // Check to see if we are done loading data.  Otherwise continue and make another API call
//        guard !NetworkManager.instance.isEndOfData else {
//            print("&&& in isEndOfData")
//            return UITableViewCell()
//        }
        print("&&&& indexPath.row is: ", indexPath.row)
        // print("&&& (currentPage): ", currentPage)
        /// If we at PAGE_SIZE, go get the next page
//        if indexPath.row == PAGE_SIZE {
//            DispatchQueue.main.async {
//                tableView.reloadData()
//            }
//        }
        let pageToGet = indexPath.row / PAGE_SIZE
        let productToGet = indexPath.row % PAGE_SIZE
        guard let product = NetworkManager.instance.allProducts[pageToGet].products?[productToGet]  else {
            return UITableViewCell()
        }
        
        cell.configureCell(product: product)
        return cell
    }
    
        
        
    /// might try this for spinner and data loading.....https://stackoverflow.com/questions/32425466/load-more-after-coming-to-bottom-of-uitableview
    /// Add spinner at bottom of table view when loading more data from the API call
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            
            tableFooterView.isHidden = false
//            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
//            spinner.startAnimating()
//            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
//
//            self.tableView.tableFooterView = spinner
//            self.tableView.tableFooterView?.isHidden = false
            
            // need to set spinner to nil after getting data
        }
    }
    
    /// might try this for spinner and data loading.....https://stackoverflow.com/questions/32425466/load-more-after-coming-to-bottom-of-uitableview
    // https://stackoverflow.com/questions/20269474/uitableview-load-more-when-scrolling-to-bottom-like-facebook-application
//    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//
//        // UITableView only moves in one direction, y axis
//        let currentOffset = scrollView.contentOffset.y
//        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
//
//        // Change 10.0 to adjust the distance from bottom
//        if maximumOffset - currentOffset <= 10.0 {
//            // self.loadMore()
//            /// Get more products
//            NetworkManager.instance.getProductsForPage(pageNumber: 1, pageSize: PAGE_SIZE) { (response) in
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//        }
//    }
//
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
