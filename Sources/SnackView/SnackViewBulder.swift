//
//  SnackView.swift
//  Rishad Appat
//
//  Created by Rishad Appat on 30/04/2020.
//  Copyright © 2020 Appat. All rights reserved.
//

import UIKit

public class SnackViewBulder: NSObject {
    private var snackView: UIView!
    private var isSnackViewShowing: Bool = false
    private var timer: Timer? = nil
    private var snackConfig: SnackConfig!
    
    public func buildSuccess(withMessage message: String)
    {
        self.snackConfig = SnackConfig().getSuccessConfig()
        showSnackView(withMessage: message, bgColor: self.snackConfig.bgColor, fontColor: self.snackConfig.messageTextColor, iconName: self.snackConfig.iconName, autoHide: self.snackConfig.autoHide)
    }
    
    public func buildError(withMessage message: String)
    {
        self.snackConfig = SnackConfig().getErrorConfig()
        showSnackView(withMessage: message, bgColor: self.snackConfig.bgColor, fontColor: self.snackConfig.messageTextColor, iconName: self.snackConfig.iconName, autoHide: self.snackConfig.autoHide)
    }
    
    public func buildInfo(withMessage message: String)
    {
        self.snackConfig = SnackConfig().getInfoConfig()
        showSnackView(withMessage: message, bgColor: self.snackConfig.bgColor, fontColor: self.snackConfig.messageTextColor, iconName: self.snackConfig.iconName, autoHide: self.snackConfig.autoHide)
    }
    
    private func showSnackView(withMessage message: String, bgColor color: String, fontColor textColor: UIColor, iconName iconImg: String, autoHide: Bool)
    {
        if let view = UIApplication.shared.keyWindows
        {
            self.hideSnackViewCallback {
                self.timer?.invalidate()
                var snackviewHeight: CGFloat = 50
                self.snackView = UIView.init(frame: CGRect.init(x: 16, y: view.frame.height + 8, width: view.frame.size.width - 32, height: snackviewHeight))
                let bgColor = UIColor(hex: color)
                self.snackView.cornerRadius = self.snackConfig.cornerRadius
                self.snackView.shadowRadius = 8
                self.snackView.shadowOpacity = 0.8
                self.snackView.borderWidth = 1
                self.snackView.borderColor = bgColor
                self.snackView.shadowOffset = CGSize.init(width: 0, height: 0)
                
                let messageLabel = UILabel.init(frame: CGRect.init(x: 16, y: 8, width: self.snackView.frame.size.width - 52, height: snackviewHeight))
                messageLabel.textAlignment = .natural
                messageLabel.text = message
                messageLabel.numberOfLines = 0
                messageLabel.lineBreakMode = .byWordWrapping
                messageLabel.textColor = textColor
                messageLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                messageLabel.sizeToFit()
                snackviewHeight = messageLabel.frame.height + 16 >= 50 ? messageLabel.frame.height + 16 : 50
                self.snackView.frame.size.height = snackviewHeight
                
                messageLabel.Y = (self.snackView.frame.height/2) - (messageLabel.frame.height/2)
                
                let messageImage = UIImageView.init(frame: CGRect.init(x: self.snackView.frame.width - 40, y: (self.snackView.frame.size.height/2) - 15, width: 30, height: 30))
                messageImage.contentMode = .scaleAspectFit
                messageImage.image = UIImage.init(named: iconImg)
                messageImage.backgroundColor = .clear
                
                let blurEffectView: UIVisualEffectView = {
                    let blurEffect = UIBlurEffect(style: .dark)
                    let blurEffectView = UIVisualEffectView(effect: blurEffect)
                    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
                    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
                    blurEffectView.contentView.addSubview(vibrancyView)
                    blurEffectView.backgroundColor = bgColor.withAlphaComponent(0.8)
                    return blurEffectView
                }()
                blurEffectView.frame = self.snackView.bounds
                blurEffectView.cornerRadius = self.snackConfig.cornerRadius
                self.snackView.addSubview(blurEffectView)
                self.snackView.addSubview(messageLabel)
                self.snackView.addSubview(messageImage)
                self.show()
            }
        }
    }
    
    func show()
    {
        if let view = UIApplication.shared.keyWindows
        {
            view.addSubview(self.snackView)
            self.isSnackViewShowing = true
            self.snackView.alpha = 0
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
                self.snackView.Y = view.frame.height - self.snackView.frame.height - self.snackView.safeAreaInsets.bottom - 20
                self.snackView?.alpha = 1
            }) { completed in
                if(self.snackConfig.autoHide)
                {
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hideSnackView), userInfo: nil, repeats: false)
                }
            }
        }
    }
    
    @objc func hideSnackViewCallback(dismissed: @escaping () -> Void)
    {
        if(snackView != nil)
        {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
                self.snackView.alpha = 0
                self.snackView.Y = self.snackView.Y + self.snackView.safeAreaInsets.bottom + self.snackView.frame.height + 20
            }) { completed in
                self.snackView.removeFromSuperview()
                self.isSnackViewShowing = false
                self.snackView = nil
                dismissed()
            }
        }
        else
        {
            dismissed()
        }
    }
    
    @objc func hideSnackView()
    {
        hideSnackViewCallback {
            
        }
    }
}
