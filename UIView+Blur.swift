//
//  UIView+Blur.swift
//  UIView-Blur
//
//  Created by Marc Stroebel on 2014/11/24.
//  Copyright (c) 2014 StroebelSoftware. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBlurEffect() {
        self.addBlurEffect(self, widthConstraintView: self)
    }
    
    func addBlurEffect(heightConstraintView: UIView, widthConstraintView: UIView) {
        self.addBlurEffect(heightConstraintView, heightMultiplier: 1, widthConstraintView: widthConstraintView, widthMultiplier: 1)
    }
    
    func addBlurEffect(heightConstraintView: UIView, heightMultiplier: CGFloat, widthConstraintView: UIView, widthMultiplier: CGFloat) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.insertSubview(blurView, atIndex: 0)
        
        var headerViewHeightConstraint = NSLayoutConstraint(item: blurView,
            attribute: .Height, relatedBy: .Equal, toItem: heightConstraintView,
            attribute: .Height, multiplier: heightMultiplier, constant: 0)
        var headerViewWidthConstraint = NSLayoutConstraint(item: blurView,
            attribute: .Width, relatedBy: .Equal, toItem: widthConstraintView,
            attribute: .Width, multiplier: widthMultiplier, constant: 0)
        
        self.addConstraints([ headerViewHeightConstraint, headerViewWidthConstraint ])
    }
}
