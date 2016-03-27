//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Martynas Kausas on 3/27/16.
//  Copyright © 2016 Marty Kausas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var navBarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarButton.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onNavTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
