//
//  ViewController.swift
//  dinAR
//
//  Created by Aaryaman Saini on 15/05/21.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    var item: String = ""
    var dish: String = ""
    var count = 0
    var itemArray = [SCNNode]()

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        
        
        if (item == "AppleStrudel"){
            dish = "art.scnassets/AppleStrudel.scn"
        }
        if(item == "Cake"){
            dish = "art.scnassets/Cake.scn"
        }
        if(item == "CerealBowl"){
            dish = "art.scnassets/cereals.scn"
        }
        if(item == "Hotdog"){
            dish = "art.scnassets/Hotdog.scn"
        }
        if(item == "LobsterTail"){
            dish = "art.scnassets/LobsterTail.scn"
        }
        if(item == "Pizza"){
            dish = "art.scnassets/Pizza.scn"
        }
        if(item == "SweetBun"){
            dish = "art.scnassets/SweetBun.scn"
        }
        if(item == "Tea"){
            dish = "art.scnassets/Tea.scn"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
            
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        

        // Run the view's session
        sceneView.session.run(configuration)
            
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        count = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchLocation = touch.location(in: sceneView)
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
            
            if let hitResult = results.first {
                // Create a new scene
                if count == 0{
                    let scene = SCNScene(named: dish)!
                    if let sceneNode = scene.rootNode.childNode(withName: item, recursively: true){
                        sceneNode.position = SCNVector3(
                            x: hitResult.worldTransform.columns.3.x,
                            y: hitResult.worldTransform.columns.3.y ,
                            z: hitResult.worldTransform.columns.3.z)
                        sceneView.scene.rootNode.addChildNode(sceneNode)
                        itemArray.append(sceneNode)
                        count = 1
                    }
                }
                
            }
        }
    }
    
    @IBAction func removeItem(_ sender: UIBarButtonItem) {
        if !itemArray.isEmpty{
            for meal in itemArray{
                meal.removeFromParentNode()
                count = 0
            }
        }
        
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARPlaneAnchor{
            let planeAnchor = anchor as! ARPlaneAnchor
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            let planeNode = SCNNode()
            planeNode.position = SCNVector3(x: planeAnchor.center.x, y: 0, z: planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/thisgrid.png")
            plane.materials = [gridMaterial]
            planeNode.geometry = plane
            node.addChildNode(planeNode)
            
        }else{
            return
        }
    }

   
}
