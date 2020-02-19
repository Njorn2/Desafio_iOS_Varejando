//
//  UIView+loading.swift
//  Varejando
//
//  Created by Ruan Gustavo de Oliveira on 16/02/20.
//  Copyright © 2020 Ruan Gustavo de Oliveira. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func presentActivity() {
        let activity = UIActivityIndicatorView(frame: self.frame)
        activity.backgroundColor = UIColor.white
        activity.color = UIColor.title
        activity.startAnimating()
        
        addSubview(activity)
    }
    
    func stopActivity() {
        subviews.forEach({ view in
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        })
    }
    
    override open func copy() -> Any {
        super.copy()
        
        let view = UIView()
        view.size(self.frame.size)
        view.backgroundColor = self.backgroundColor
        return view
    }
    
    func position(_ position: CGPoint) {
        self.frame.origin = position
    }
    
    func size(_ size: CGSize) {
        self.frame.size = size
    }
    
    func cornerRadius(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func circle() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    func isVisible(_ view: UIView) -> Bool {
        if view.isHidden || view.superview == nil {
            return false
        }

        if let window = UIApplication.shared.windows.first, let rootViewController = window.rootViewController,
            let rootView = rootViewController.view {

            let viewFrame = view.convert(view.bounds, to: rootView)

            let topSafeArea: CGFloat
            let bottomSafeArea: CGFloat

            if #available(iOS 11.0, *) {
                topSafeArea = rootView.safeAreaInsets.top
                bottomSafeArea = rootView.safeAreaInsets.bottom
            } else {
                topSafeArea = rootViewController.topLayoutGuide.length
                bottomSafeArea = rootViewController.bottomLayoutGuide.length
            }

            return viewFrame.minX >= 0 &&
                   viewFrame.maxX <= rootView.bounds.width &&
                   viewFrame.minY >= topSafeArea &&
                   viewFrame.maxY <= rootView.bounds.height - bottomSafeArea
        }

        return false
    }
}
