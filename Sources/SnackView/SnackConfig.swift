//
//  File.swift
//  
//
//  Created by Rishad Appat on 23/12/2021.
//

import UIKit

class SnackConfig
{
    var bgColor = "00ad00"
    var iconName = ""
    var cornerRadius: CGFloat = 25
    var autoHide = true
    var position: Position = .Bottom
    var messageFont = UIFont.systemFont(ofSize: 15)
    var messageTextColor: UIColor = .white
    
    
    internal enum Position
    {
        case Top
        case Bottom
    }
    
    init()
    {
        
    }
}
