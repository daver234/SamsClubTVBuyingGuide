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

class ShowTVinRoom: UIViewController, ARSCNViewDelegate, UIPopoverPresentationControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/television.dae")!
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
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
    
    @IBAction func toBtnPressed(_ sender: UIButton) {
        let showTVinRoom = ShowTVinRoom(size: CGSize(width: 250, height: 500))
        showTVinRoom.modalPresentationStyle = .popover
        showTVinRoom.popoverPresentationController?.delegate = self
        present(showTVinRoom, animated: true, completion: nil)
        showTVinRoom.popoverPresentationController?.sourceView = sender
        showTVinRoom.popoverPresentationController?.sourceRect = sender.bounds
    }
}
