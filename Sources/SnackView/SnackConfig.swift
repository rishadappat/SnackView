//
//  File.swift
//  
//
//  Created by Rishad Appat on 23/12/2021.
//

import UIKit

public class SnackConfig
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
    
    internal func getErrorConfig()->SnackConfig
    {
        bgColor = "ba000d"
        iconName = ""
        cornerRadius = 25
        autoHide = true
        position = .Bottom
        messageFont = UIFont.systemFont(ofSize: 15)
        messageTextColor = .white
        return self
    }
    
    internal func getSuccessConfig()->SnackConfig
    {
        bgColor = "00ad00"
        iconName = ""
        cornerRadius = 25
        autoHide = true
        position = .Bottom
        messageFont = UIFont.systemFont(ofSize: 15)
        messageTextColor = .white
        return self
    }
    
    internal func getInfoConfig()->SnackConfig
    {
        bgColor = "0075E3"
        iconName = ""
        cornerRadius = 25
        autoHide = true
        position = .Bottom
        messageFont = UIFont.systemFont(ofSize: 15)
        messageTextColor = .white
        return self
    }
}
