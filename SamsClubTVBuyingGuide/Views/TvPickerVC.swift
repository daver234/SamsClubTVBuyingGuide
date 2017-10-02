//
//  TvPickerVC.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/30/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation
import SceneKit

class TvPickerVC: UIViewController {
    
    // MARK: - Variables
    var sceneView: SCNView!
    var size: CGSize!
    weak var showTVinRoomVC: ShowTVinRoomVC!
    
    /// Create this so that when ShowTvInRoomVC shows the popover, we can specify the size
    init(size: CGSize) {
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// setting position of the popover.  ShowTvInRoomVC will position the view
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        
        /// Initialize a Scene View; need this so it is consistent with the size set above.
        /// Create a scene and pass in a frame
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        /// now add the sceneView
        view.insertSubview(sceneView, at: 0)
        preferredContentSize = size
        
        let scene = SCNScene(named: TV_SCENE_SCN)!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        preferredContentSize = size
        
        /// Need to pick up tap on TV in popover to pass it to ShowTvInRoomVC
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
        
        let tv = TV.getTV()
        TV.startRotation(node: tv)
        scene.rootNode.addChildNode(tv)
        
    }
    
    /// Pass object to ShowTvInRoomVC
    @objc func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        /// Find location of the tap in the scene view and store it
        let p = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(p, options: [:])
        
        if hitResults.count > 0 {
            let node = hitResults[0].node
            guard let name = node.name else { return }
            print(name)
            showTVinRoomVC.onTvSelected(name)
            dismiss(animated: true, completion: nil)
        }
    }
}
