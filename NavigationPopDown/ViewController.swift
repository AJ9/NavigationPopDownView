//
//  ViewController.swift
//  NavigationPopDown
//
//  Created by Adam Gask on 14/08/2015.
//  Copyright © 2015 AJ9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show(sender: AnyObject) {
        showNavigationDropDownView(self.navigationController!, message: "Message", height: 25)
    }
    
    
    func showNavigationDropDownView(navigationController: UINavigationController, message: String, height: CGFloat){
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let navigationControllerHeight =  navigationController.navigationBar.frame.size.height
        
        let startingPosition = navigationControllerHeight + statusBarHeight - height
        
        //Navbar
        let navbar = NavigationPopDownView(frame: CGRectMake(0, startingPosition, navigationController.navigationBar.frame.size.width, height))
        navbar.titleLabel.text = message
        
        navigationController.navigationBar.superview?.insertSubview(navbar, belowSubview: navigationController.navigationBar)
        
        //Animate down
        UIView.animateWithDuration(0.3, animations: {
            var frame = navbar.frame
            frame.origin.y = navigationControllerHeight + statusBarHeight
            navbar.frame = frame;
        })
    }

}

