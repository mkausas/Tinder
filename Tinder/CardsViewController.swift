//
//  ViewController.swift
//  Tinder
//
//  Created by Martynas Kausas on 3/24/16.
//  Copyright © 2016 Marty Kausas. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var previousCardPoint: CGPoint!
    @IBAction func cardPanGestureRecognizer(sender: UIPanGestureRecognizer) {

//        let translation = sender.translationInView(view)
//        
//        if sender.state == UIGestureRecognizerState.Began {
//            NSLog("began")
//            previousCardPoint = cardImageView.center
//            
//        } else if sender.state == UIGestureRecognizerState.Changed {
//            NSLog("changed")
//            
//            var center = previousCardPoint
//            center.x += translation.x
////            center.y += translation.y
//            
//            cardImageView.center = center
//        } else if sender.state == UIGestureRecognizerState.Ended {
//            NSLog("Ended")
//        }
    }

}

