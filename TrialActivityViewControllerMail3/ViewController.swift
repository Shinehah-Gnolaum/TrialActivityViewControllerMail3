//
//  ViewController.swift
//  TrialActivityViewControllerMail3
//
//  Created by Daniel Brower on 5/26/17.
//  Copyright © 2017 Texarkana Software Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var barButtonItemMore: UIBarButtonItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func more(_ sender: UIBarButtonItem) {
        
        let mailItemProvider = TSSMailItemProvider(placeholderItem: textView.text as Any)
        
        let activityItems = [mailItemProvider]
        
        let activityMail = TSSActivityMail()
        
        let applicationActivities = [activityMail]
        
        let activityViewController = UIActivityViewController.init(activityItems: activityItems, applicationActivities: applicationActivities)
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad) {
            
            activityViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            activityViewController.preferredContentSize = CGSize(width: 0, height: 0)
            activityViewController.popoverPresentationController?.barButtonItem = barButtonItemMore
            
        }
        
        present(activityViewController, animated: true, completion: nil)
        
    }

}

