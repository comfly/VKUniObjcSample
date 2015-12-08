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
        
        let completionBlock: Int32 -> Void = { [weak self] in
            guard let sself = self else { return }
            
            sself.resultLabel.text = "Result: \($0)"
            sself.activityIndicator.stopAnimating()
        }
        
        filter.generateWithCompletionBlock {
            filter.countWithPredicate(curry(<)(100000), completionBlock: completionBlock)
        }
    }
}

private func curry<A, B, R>(f: (A, B) -> R) -> A -> B -> R {
    return {a in {b in f(a, b) }}
}