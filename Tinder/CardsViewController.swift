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
    
    @IBAction func onProfileTap(sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let profViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        
        modalPresentationStyle = UIModalPresentationStyle.Popover
        
        
        presentViewController(profViewController, animated: true, completion: {
            print("completed")
        })        
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
        let vc = segue.destinationViewController as! ProfileViewController
        
        vc.profileImageView.image = self.cardImageView.image
        
     // Pass the selected object to the new view controller.
     }
 


}

