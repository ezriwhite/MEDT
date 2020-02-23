//
//  GradientView.swift
//  MEDT
//
//  Created by Ezri Laura Oppenheim White on 2/22/20.
//  Copyright © 2020 MECT. All rights reserved.
//
import UIKit

@IBDesignable
class GradientView: UIView {
 @IBInspectable var firstColor: UIColor = UIColor.clear {
   didSet {
       updateView()
    }
 }
 @IBInspectable var secondColor: UIColor = UIColor.clear {
    didSet {
        updateView()
    }
}
    
override class var layerClass: AnyClass {
    get {
        return CAGradientLayer.self
    }
}
 func updateView() {
    let layer = self.layer as! CAGradientLayer
    layer.colors = [firstColor, secondColor].map{$0.cgColor}
 }
}
