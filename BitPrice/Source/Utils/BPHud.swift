//
//  BPHud.swift
//  BitPrice
//
//  Created by Norberto Vasconcelos on 11/09/16.
//  Copyright © 2016 Norberto Vasconcelos. All rights reserved.
//

import UIKit
import MBProgressHUD


class BPHud {
    
    static var progressHud: MBProgressHUD!
    
    static func show() {
        let window: UIWindow = UIApplication.sharedApplication().keyWindow!
        
//        let animatedImageView: UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 50.0, height: 50.0))
//        animatedImageView.createAnimatedImage("spinner_", range: 0...10)
//        animatedImageView.contentMode = UIViewContentMode.ScaleAspectFit
//        animatedImageView.backgroundColor = UIColor.clearColor()
        
        progressHud = MBProgressHUD.showHUDAddedTo(window, animated: true)
//        progressHud.customView = animatedImageView
        progressHud.mode = MBProgressHUDMode.Indeterminate
        progressHud.bezelView.color = UIColor.clearColor()
        progressHud.backgroundView.color = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        progressHud.showAnimated(true)
        
    }
    
    static func hide() {
        progressHud.hideAnimated(true)
    }
    
    
}

