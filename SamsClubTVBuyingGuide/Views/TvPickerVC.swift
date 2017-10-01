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
    
    var sceneView: SCNView!
    var size: CGSize!
    
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
        
        let scene = SCNScene(named: "art.scnassets/tvsScene.scn")!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let obj = SCNScene(named: "art.scnassets/smallBlackTV2.dae")
        let node = obj?.rootNode.childNode(withName: "smallTelevision", recursively: true)
        node?.scale = SCNVector3Make(0.0062, 0.0062, 0.002)
        node?.position = SCNVector3Make(-0.95, 0.5, -1)
        guard let nodeReady = node else { return }
        scene.rootNode.addChildNode(nodeReady)
        
        preferredContentSize = size
        
    }
}
