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
    @IBOutlet weak var rotateBtn: UIButton!
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var controls: UIStackView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        // sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: MAIN_SCENE)!
        sceneView.automaticallyUpdatesLighting = true
        
        // Set the scene to the view
        sceneView.scene = scene
        
        tvPickerBtn.layer.cornerRadius = 10
        
        let gesture1 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(gesture:)))
        let gesture2 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(gesture:)))
        let gesture3 = UILongPressGestureRecognizer(target: self, action: #selector(onLongPress(gesture:)))
        gesture1.minimumPressDuration = 0.3
        gesture2.minimumPressDuration = 0.3
        gesture3.minimumPressDuration = 0.3
        rotateBtn.addGestureRecognizer(gesture1)
        upBtn.addGestureRecognizer(gesture2)
        downBtn.addGestureRecognizer(gesture3)
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
    
    func session(_ session: ARSession, didFailWithError error: Error) {
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = sceneView.hitTest(touch.location(in: sceneView), types: [.featurePoint])
        guard  let hitFeature = results.last else { return }
        let hitTransform = SCNMatrix4(hitFeature.worldTransform)
        let hitPosition = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
        placeTV(position: hitPosition)
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
            controls.isHidden = false
            let tv = TV.getTVForName(tvName: tvName)
            selectedTV = tv
            tv.position = position
            if tvName == "retro" {
                /// Set size of TV in camera view
                tv.scale = SCNVector3Make(0.0050, 0.0050, 0.0050)
            } else {
                tv.scale = SCNVector3Make(0.9, 0.9, 0.9)
            }
            
            sceneView.scene.rootNode.addChildNode(tv)
        }
    }
    
    @IBAction func onRemovePressed(_ sender: Any) {
        if let tv = selectedTV {
            tv.removeFromParentNode()
            selectedTV = nil
        }
    }
    
    /// For placing TV in the scene
    @objc func onLongPress(gesture: UILongPressGestureRecognizer) {
        if let tv = selectedTV {
            if gesture.state == .ended {
                tv.removeAllActions()
            } else if gesture.state == .began {
                if gesture.view === rotateBtn {
                    let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.08 * Double.pi), z: 0, duration: 0.1))
                    tv.runAction(rotate)
                } else if gesture.view === upBtn {
                    let move = SCNAction.repeatForever(SCNAction.moveBy(x: 0, y: 0.08, z: 0, duration: 0.1))
                    tv.runAction(move)
                } else if gesture.view === downBtn {
                    let move = SCNAction.repeatForever(SCNAction.moveBy(x: 0, y: -0.08, z: 0, duration: 0.1))
                    tv.runAction(move)
                }
            }
        }
    }
    
}
