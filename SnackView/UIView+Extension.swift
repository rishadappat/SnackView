//
//  UIView+Extension.swift
//  ADP Prototype
//
//  Created by ADPolice on 3/18/18.
//  Copyright © 2018 ADPolice. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor.init(cgColor:layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat{
        get {
            return layer.shadowRadius
        }
        set {
            if(shadowRadius != 0)
            {
                layer.masksToBounds = false
                layer.shadowColor = shadowColor
                layer.shadowOffset = shadowOffset
                layer.shadowOpacity = shadowOpacity
                layer.shadowRadius = newValue
            }
        }
    }
    
    @IBInspectable
    var shadowColor: CGColor{
        get {
            return UIColor(red:0.11, green:0.12, blue:0.17, alpha:1.0).cgColor
        }
        set {
            if(shadowOpacity != 0)
            {
                layer.shadowColor = newValue
            }
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float{
        get {
            return 0.3
        }
        set {
            if(shadowOpacity != 0)
            {
                layer.shadowOpacity = newValue
            }
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize{
        get {
            return CGSize.init(width: 0, height: 3)
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    var X: CGFloat{
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var Y: CGFloat{
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
}
