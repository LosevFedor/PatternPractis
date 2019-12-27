//
//  UserDescription.swift
//  PatternsPractis
//
//  Created by Fedor Losev on 27/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class UserDescription: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var delegate: UserDescriptionDelegate?
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    @IBAction func addDescriptionBtnPressed(_ sender: Any) {
        self.delegate?.getUserDescription(text: textView.text!)
        dismiss(animated: true, completion: nil)
    }
}
