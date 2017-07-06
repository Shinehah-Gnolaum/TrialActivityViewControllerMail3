//
//  TSSMailItemProvider.swift
//  TrialActivityViewControllerMail2
//
//  Created by Daniel Brower on 5/26/17.
//  Copyright © 2017 Texarkana Software Solutions. All rights reserved.
//

import UIKit

class TSSMailItemProvider: UIActivityItemProvider {
    
    var placeholderItemAny: Any
    var localActivityType: UIActivityType?
    
    override init(placeholderItem: Any) {
        
        placeholderItemAny = placeholderItem
        
        super.init(placeholderItem: placeholderItem)
        
    }
    
    override var item: Any {
        
        get {
            
            let itemAny = NSString(string: placeholderItemAny as! String)
            
            localActivityType = UIActivityType.mail
            
            return itemAny
            
        }
        
    }
    
    override var placeholderItem: Any? {
        
        get {
            
            return placeholderItemAny
            
        }
        
    }
    
    override var activityType: UIActivityType? {
        
        get {
            
            return localActivityType
            
        }
        
    }
    
}
