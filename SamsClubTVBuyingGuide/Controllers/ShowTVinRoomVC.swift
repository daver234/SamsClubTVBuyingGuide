//
//  ShowTVinRoom.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/30/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

import UIKit
import SceneKit
import ARKit

class ShowTVinRoomVC: UIViewController, ARSCNViewDelegate, UIPopoverPresentationControllerDelegate {
    
    // MARK: - Variables
    var selectedTVName: String?
    var selectedTV: SCNNode?
    
    // MARK: - IBOutlets
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var tvPickerBtn: UIButton!
    
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/television.dae")!
        sceneView.automaticallyUpdatesLighting = true
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    @IBAction func tvBtnPressed(_ sender: UIButton) {
        /// Set size of popover
        let tvPickerVC = TvPickerVC(size: CGSize(width: 250, height: 500))
        tvPickerVC.showTVinRoomVC = self
        tvPickerVC.modalPresentationStyle = .popover
        tvPickerVC.popoverPresentationController?.delegate = self
        present(tvPickerVC, animated: true, completion: nil)
        tvPickerVC.popoverPresentationController?.sourceView = sender
        tvPickerVC.popoverPresentationController?.sourceRect = sender.bounds
    }
    
    func onTvSelected(_ tvName: String) {
        selectedTVName = tvName
    }
    
    func placeTV(position: SCNVector3) {
        if let tvName = selectedTVName {
            // controls.isHidden = false
            let tv = TV.getTVForName(tvName: tvName)
            selectedTV = tv
            tv.position = position
            tv.scale = SCNVector3Make(0.01, 0.01, 0.01)
            sceneView.scene.rootNode.addChildNode(tv)
        }
    }
}
