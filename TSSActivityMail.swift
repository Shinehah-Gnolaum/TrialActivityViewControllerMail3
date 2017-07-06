//
//  TSSActivityMail.swift
//  TrialActivityViewControllerMail3
//
//  Created by Daniel Brower on 5/26/17.
//  Copyright © 2017 Texarkana Software Solutions. All rights reserved.
//

import UIKit
import MessageUI

class TSSActivityMail: UIActivity, MFMailComposeViewControllerDelegate {
    
    var activityItem: Any?
    
    let mailComposeViewController = MFMailComposeViewController()
    
    override init() {
        
        super.init()
        
    }

    // Succeed when activityType is remarked out or when it returns nil.
    override var activityType: UIActivityType? {
        
        get {
            
            return UIActivityType.mail
            
        }
        
    }
    
    override var activityTitle: String? {
        
        get {
            
            return "Mail"
            
        }
        
    }
    
    override var activityImage: UIImage? {
        
        get {
            
            return UIImage(imageLiteralResourceName: "email.png")
            
        }
        
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        
        // !!! Perform checks.
        
        return true
        
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        
        activityItem = activityItems[0] // $$$ as! String
        
        mailComposeViewController.mailComposeDelegate = self
        
        let filename = "file.txt"
        
        mailComposeViewController.setSubject("subject")
        mailComposeViewController.setMessageBody("Message body.", isHTML: false)
        
        let content = activityItem as! String // $$$ ('as! String' was added)
        
        let length = content.lengthOfBytes(using: String.Encoding.utf8)
        
        let outputData = NSData(bytes:content, length: length) as Data
        
        mailComposeViewController.addAttachmentData(outputData, mimeType: "plain", fileName: filename)
        

    }
    
    override class var activityCategory: UIActivityCategory {
        
        get {
            
            return UIActivityCategory.action
            
        }
        
    }
    
    override var activityViewController: UIViewController? {
        
        get {
            
            return mailComposeViewController as UIViewController // $$$ ('as UIViewController' was added)
            
        }
    
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        print("TSSActivityMail.mailComposeController(_:_:_:)")
        
        // Check the result or perform other tasks.
        print("result.rawValue = \(result.rawValue)")
        
        if let error = error {
            
            print("error.localizedDescription = \(error.localizedDescription)")
            
            self.activityDidFinish(false)
            
        }
        else
        {
            
            if !(result == MFMailComposeResult.sent) {
                
                self.activityDidFinish(false)
                
            }
            else
            {
                
                self.activityDidFinish(true)
                
            }
            
        }
    }

}
