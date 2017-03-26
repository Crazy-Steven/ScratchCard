//
//  ViewController.swift
//  ScratchCard
//
//  Created by 郭艾超 on 17/3/26.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!
    var isTouch:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch:AnyObject in touches {
            let t:UITouch = touch as! UITouch
            if t.view == myImage {
                isTouch = true;
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isTouch == true {
            
            for touch:AnyObject in touches {
                
                UIGraphicsBeginImageContext(myImage.frame.size)
                myImage.image?.draw(in: myImage.bounds)
                let t:UITouch = touch as! UITouch
                let point = t.location(in: t.view)
                let rect = CGRect(x:point.x - 10 ,y:point.y - 10, width: 20, height: 20)
                UIGraphicsGetCurrentContext()!.clear(rect)
                myImage.image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouch = false
    }

}

