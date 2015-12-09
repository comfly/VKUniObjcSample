//
//  PIMPLSampleViewController.swift
//  VKUniObjcSample
//
//  Created by Dmitry Zakharov on 08/12/15.
//  Copyright © 2015 VKontakte. All rights reserved.
//

import UIKit


public class PIMPLSampleViewController: UIViewController, SampleController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    public static func descriptor() -> SampleDescriptorProtocol {
        return SampleDescriptor(title: "PIMPL Sample", storyboardID: "PIMPLSampleViewController")
    }
    
    @IBAction func buttonTapped() {
        
        let filter = FilterUserWrapper()
        
        activityIndicator.hidden = false;
        activityIndicator.startAnimating()
        
        func completionBlock(result: Int32) {
            resultLabel.text = "Result: \(result)"
            activityIndicator.stopAnimating()
        }
        
        filter.generateWithCompletionBlock {
            filter.countWithPredicate({ $0 < 500 }, completionBlock: completionBlock)
        }
    }
}
