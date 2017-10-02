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
class ShowAllTvsTableVC: UITableViewController, UITableViewDataSourcePrefetching, UIPopoverPresentationControllerDelegate {
    
    // MARK: - Variables
    var pageNumberForSegue = 0
    var productNumberInPageForSegue = 0

    // MARK: - Outlets
    @IBOutlet weak var filterBtn: UIBarButtonItem!
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
    
    /// Need for popover in filter button
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }

    /// Shows a filter popover view
    @IBAction func filterBtnPressed(_ sender: UIBarButtonItem) {
        let popover = storyboard?.instantiateViewController(withIdentifier: FILTER_VC) as! FilterVC
        popover.modalPresentationStyle = UIModalPresentationStyle.popover
        popover.popoverPresentationController?.backgroundColor = UIColor.green
        popover.popoverPresentationController?.delegate = self
        popover.popoverPresentationController?.backgroundColor = ColorPalette.Blue.Medium
        popover.popoverPresentationController?.sourceView = self.view
        popover.popoverPresentationController?.sourceRect = CGRect(x: self.view!.bounds.width, y: 0, width: 0, height: 0)
        popover.popoverPresentationController?.permittedArrowDirections = .up
        self.present(popover, animated: true)
    }
}



extension ShowAllTvsTableVC {
    
    // MARK: - TableView functions
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.instance.totalProductsRetrieved
    }
    
    /// Here we prefetch the images for the tableview using Kingfisher.
    /// And, prefetch more data if the user is getting to the end of the tableview.
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        /// First get the images
        let currentPage = NetworkManager.instance.numberOfPagesRetrieved - 1
        guard let product = NetworkManager.instance.allProducts[currentPage].products  else {
            return
        }
        let urls = product.flatMap { $0.productImage }
        ImagePrefetcher(urls: urls).start()
        
        /// This section is for prefetching more data before the user gets to the end of the tableview with the current data
        /// First, build an array of all the upcoming rows.
        let upcomingRows = indexPaths.map { $0.row }
        print("&&& here is upcoming rows", upcomingRows)
        
        /// Check to see what the max upcoming row number is
        if let maxIndex = upcomingRows.max() {
            fetchMoreData(maxIndex: maxIndex, currentPage: currentPage)
        }
    }
    
    /// Fetch more data if the user is getting to the end of the tableview
    func fetchMoreData(maxIndex: Int, currentPage: Int) {
        /// Here take maxIndex and add 5 to give some buffer for how soon we should get more data from the server.
        /// This will improve the user experience so no delay is perceived when scrolling the table.
        /// All of this determines the nextPage to get
        let nextPage: Int = ( (maxIndex + 5) / PAGE_SIZE)
        print("&&& FIRST nextPage", nextPage)
        print("&&&&&& maxIndex", maxIndex)
        
        /// If the user is getting to the end of the table, nextPage will be greater than current page.
        /// This will then trigger a API call to get more data from the server and return, ideally, before
        /// the user gets to the end of the table.
        if nextPage > currentPage {
            print("&&& in nextPage >", nextPage)
            print("&&& Here is current page", currentPage)
            print("&&& here is maxIndex", maxIndex)
            print("done ShowAll -------------------")
            
            NetworkManager.instance.getProductsForPage(pageNumber: nextPage, pageSize: PAGE_SIZE) { (response) in
                if response {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    print("&&& loaded all the data.  Done")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PRODUCT_CELL, for: indexPath) as? ProductViewTableViewCell else {
            return UITableViewCell()
        }

        /// Find the page with the product for the cell
        /// Just need cell number and default page size to calculate which page it is in
        let pageToGet = indexPath.row / PAGE_SIZE
        
        /// To get the product number within a page, just need the modulus of row to page size
        let productToGet = indexPath.row % PAGE_SIZE
        guard let product = NetworkManager.instance.allProducts[pageToGet].products?[productToGet]  else {
            return UITableViewCell()
        }
        
        cell.configureCell(product: product)
        return cell
    }
    
    /// This displays the "end of data" footer view when the user has scolled to the end of the available data.
    /// Because of the prefetching of data above, the user does not need to see a spinner when more data is loading.
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            tableFooterView.isHidden = false
        }
    }
    
    /// might try this for spinner and data loading.....https://stackoverflow.com/questions/32425466/load-more-after-coming-to-bottom-of-uitableview
    // https://stackoverflow.com/questions/20269474/uitableview-load-more-when-scrolling-to-bottom-like-facebook-application

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pageNumberForSegue = productNumberInPageForSegue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProductDetailVC {
            // let cell = sender as? ProductViewTableViewCell
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            destination.pageWithTV = selectedRow / PAGE_SIZE
            destination.productNumberInPage = selectedRow % PAGE_SIZE
        }
    }
}
