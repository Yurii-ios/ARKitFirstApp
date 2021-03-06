//
//  ViewController.swift
//  ARKitFirstApp
//
//  Created by Yurii Sameliuk on 23/02/2020.
//  Copyright © 2020 Yurii Sameliuk. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = shipScene
        
        for node in sceneView.scene.rootNode.childNodes {
            // efekt dwigajus4ego objekta
            let moveSpip = SCNAction.moveBy(x: 1, y: 0.5, z: 0.5, duration: 1)
           
            // efekt prozra4nosti
            let fadeOut = SCNAction.fadeOpacity(to: 0.5, duration: 1)
            let fadeIn = SCNAction.fadeOpacity(to: 1, duration: 1)
            
            let sequence = SCNAction.sequence([fadeOut, moveSpip,fadeIn ])
            
            
            let repeatForever = SCNAction.repeatForever(sequence)
            node.runAction(repeatForever)
        }
            
        
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
}
