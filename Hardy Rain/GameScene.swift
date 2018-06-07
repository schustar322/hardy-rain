//
//  GameScene.swift
//  Hardy Rain
//
//  Created by Thomas Schuster on 6/7/18.
//  Copyright © 2018 Thomas Schuster. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var path : [SKNode]?
    
    
    private var panStartPoint: CGPoint?
    
    override func didMove(to view: SKView) {
        
        self.camera = self.childNode(withName: "main_camera") as? SKCameraNode
        self.path = self.childNode(withName: "path")?.children
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(self.panGestureAction(_:)))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        guard let _ = self.camera else {
            return
        }
        
        if(sender.state == .began) {
            panStartPoint = camera?.position
        }
        
        let translation = sender.translation(in: self.view)
        let newPosition = CGPoint(
            x: panStartPoint!.x + translation.x * -1,
            y: panStartPoint!.y + translation.y
        )
        camera!.position = newPosition
    }
}
