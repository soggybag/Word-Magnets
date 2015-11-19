//
//  ViewController.swift
//  Word Magnets
//
//  Created by mitchell hudson on 4/9/15.
//  Copyright (c) 2015 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = ["Apple", "Bring", "Count", "Did", "ergo", "fly", "ground", "happy", "I", "joins"]
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBAction func takeScreenshotPressed(sender: UIButton) {
        let image = takeScreenshot(containerView)
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    
    func takeScreenshot(theView: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(theView.bounds.size, true, 0.0)
        
        theView.drawViewHierarchyInRect(theView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    
    func handlePanGesture(panGesture: UIPanGestureRecognizer) {
        // translation 
        let translation = panGesture.translationInView(view)
        panGesture.setTranslation(CGPointZero, inView: view)
        // println(translation)
        // DX DY
        let label = panGesture.view as! UILabel
        var offset = label.center
        label.center = CGPoint(x: label.center.x + translation.x, y: label.center.y + translation.y)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        for i in array {
            let label = UILabel()
            label.text = i
            label.sizeToFit()
            let labelRect = label.frame
            let newRect = CGRectInset(labelRect, -5, -5)
            label.frame = newRect
            label.textAlignment = NSTextAlignment.Center
            
            label.layer.borderColor = UIColor.grayColor().CGColor
            label.layer.borderWidth = 1
            label.layer.shadowColor = UIColor.blackColor().CGColor
            label.layer.shadowOffset = CGSizeMake(2, 2)
            label.layer.shadowRadius = 3
            label.layer.shadowOpacity = 0.5
            
            label.backgroundColor = UIColor.whiteColor()
            
            containerView.addSubview(label)
            
            let x = CGFloat(arc4random_uniform(300)) + 10
            let y = CGFloat(arc4random_uniform(450)) + 20
            label.center = CGPoint(x: x, y: y)
            label.userInteractionEnabled = true
            
            let pan = UIPanGestureRecognizer(target: self, action: Selector("handlePanGesture:"))
            label.addGestureRecognizer(pan)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

