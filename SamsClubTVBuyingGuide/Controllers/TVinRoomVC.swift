//
//  TVinRoomVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/30/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class TVinRoomVC: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var tvBtnPressed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 
    @IBAction func tvBtnPressed(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
