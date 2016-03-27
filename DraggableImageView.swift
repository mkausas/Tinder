//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Martynas Kausas on 3/24/16.
//  Copyright © 2016 Marty Kausas. All rights reserved.
//

import UIKit

//@IBDesignable
class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
//    @IBInspectable var cornerRadius: CGFloat? = 0 {
//        didSet {
//            if let radius = cornerRadius {
//                imageView.layer.cornerRadius = radius
//                imageView.clipsToBounds = true
//            } 
//        }
//    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        contentView.frame = bounds
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        imageView.userInteractionEnabled = true
//        originalCardPoint = CGPoint(x: imageView.center.x/2 + contentView.center.x / 2, y: imageView.center.y/2 + contentView.center.y / 2)
        originalCardPoint = CGPoint(x: contentView.center.x + 27, y: contentView.center.y + 27)
        
    }
    
    
    var previousCardPoint: CGPoint!
    var originalCardPoint: CGPoint!
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(contentView)
        let velocity = sender.velocityInView(contentView)
        let position = sender.locationInView(contentView)
        
        if sender.state == UIGestureRecognizerState.Began {
            previousCardPoint = imageView.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            var center = previousCardPoint
            center.x += translation.x
            
            imageView.center = center
            print("position: \(position.y) translation: \(translation.y) velocity: \(velocity.x)")
            
            var radians: CGFloat
            
            if position.y > 150 {
                radians = CGFloat(Double(-translation.x / 100) * M_PI / 180)
            } else {
                radians = CGFloat(Double(translation.x / 100) * M_PI / 180)
            }
            
            
            imageView.transform = CGAffineTransformRotate(imageView.transform, radians)

        } else if sender.state == UIGestureRecognizerState.Ended {
            var newPoint: CGPoint
            
            if translation.x > 75 {
                newPoint = CGPoint(x: originalCardPoint.x + 500, y: originalCardPoint.y)
            } else if translation.x < -75 {
                newPoint = CGPoint(x: originalCardPoint.x - 500, y: originalCardPoint.y)
            } else {
                newPoint = originalCardPoint
            }
            
//            UIView.animateWithDuration(0.5, animations: {
//                
//                self.imageView.center = newPoint
//                self.imageView.transform = CGAffineTransformMakeRotation(0)
//            })
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.imageView.center = newPoint
                self.imageView.transform = CGAffineTransformMakeRotation(0)
                
                }, completion: { (success) in
                    if newPoint.x != self.originalCardPoint.x {
                        self.imageView.center = self.originalCardPoint
                        self.imageView.alpha = 0
                        
                        
                        UIView.animateWithDuration(0.25, animations: {
                            self.imageView.alpha = 1
                        })
                        
                    }
                    
                    
            })
                
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

//extension UIView {
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//}
