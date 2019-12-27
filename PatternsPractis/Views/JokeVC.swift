//
//  JokeVC.swift
//  PatternsPractis
//
//  Created by Fedor Losev on 27/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class JokeVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var delegate: JokeDelegate?
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func addJoke(_ sender: Any) {
        
            self.delegate?.getJoke(text: self.textField.text!)
        dismiss(animated: true, completion: nil)
    }
}
