//
//  ViewController.swift
//  tms_13
//
//  Created by Roman Dod on 8/3/20.
//  Copyright © 2020 Roman Dod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let viewV = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        viewV.setRadiusWithShadow(40)
        self.view.addSubview(viewV)
        viewV.clipsToBounds = true
        
        let secondView = UIView(frame: CGRect(x: 1, y: 1, width: 90, height: 90))
//        secondView.setRadiusWithShadow(40)
        secondView.radius(40)
        secondView.addGradient()
        secondView.clipsToBounds = true
        viewV.addSubview(secondView)
        
        
        
    }
    
}

extension UIView{
    
    func radius(_ radius: CGFloat = 10){
        
        self.layer.cornerRadius = radius
    }
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowRadius = 40
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
    }
    
    func addGradient() {
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradient.opacity = 1
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = self.bounds
        layer.addSublayer(gradient)
        
    }
    
    func setRadiusWithShadow(_ radius: CGFloat? = nil) {
        layer.cornerRadius = radius ?? self.frame.width / 2
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 10.0, height: 15)
        layer.shadowRadius = 1.0
        layer.shadowOpacity = 0.7
        layer.masksToBounds = false
    }
    
    func createView(_ parentView: UIView, _ x: CGFloat = 100, _ y: CGFloat = 100, _ width: CGFloat = 100, _ height: CGFloat = 100) -> UIView {
        let viewV = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        parentView.addSubview(viewV)
        return viewV
    }
    
    func randomColor() -> UIColor {
        let color = UIColor.init(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return color
    }
}

