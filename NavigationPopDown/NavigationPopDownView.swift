//
//  CustomNav.swift
//  NavTest
//
//  Created by Adam Gask on 14/08/2015.
//  Copyright © 2015 AJ9. All rights reserved.
//

import UIKit

class NavigationPopDownView: UIView {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var containerView: UIView!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    
    func xibSetup() {
        containerView = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        containerView.frame = bounds
        
        // Make the view stretch with containing view
        containerView.autoresizingMask =  [.FlexibleWidth, .FlexibleHeight]
        
        // make the cross button white
        
        dismissButton.tintColor = UIColor.whiteColor()  
        
        
        addSubview(containerView)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "NavigationPopDownView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        
        UIView.animateWithDuration(0.3, animations: {
            var frame = self.frame
            frame.origin.y = frame.origin.y - frame.size.height
            self.frame = frame;
            }, completion: {
                finished in
                self.removeFromSuperview()
            })
    }
    
}
