//
//  SupportClasses.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 10/1/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import UIKit
import SceneKit
import SwiftSpinner

class SpinState: UIViewController {
    
}

class TV {
    
    /// Set to add more TVs to popover as options to place in view
    class func getTVForName(tvName: String) -> SCNNode {
        switch tvName{
        case "newTelevision":
            return TV.getTV()
        default:
            return TV.getTV()
        }
    }
    
    /// Get one of the Tvs.  Create more classes as more TVs are added.
    class func getTV() -> SCNNode {
        let obj = SCNScene(named: BLACK_TV_DAE)
        let node = obj?.rootNode.childNode(withName: BLACK_MODEL_NAME, recursively: true)!
        node?.scale = SCNVector3Make(2.0, 2.0, 2.0)
        node?.position = SCNVector3Make(-0.75, -1, -1)
        return node!
    }
    
    /// Rotate TV in popover in ShowTVinRoomVC
    class func startRotation(node: SCNNode) {
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        node.runAction(rotate)
    }
}
