//
//  IMakVCViewController.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 15/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class IMakVC: UIViewController {
    
    @IBOutlet var generalView: UIView!
    @IBOutlet weak var bayImacBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUserColorStyle()
    }
    
    func setColorStyle(_ colorStyle: ColorStyleProtocol){
        generalView.backgroundColor = colorStyle.nameColor
        bayImacBtn.backgroundColor = colorStyle.nameColor
    }
    
    func getUserColorStyle(){
        guard let newColor = UserDefaults.standard.string(forKey: "colorStyle") else { return }
        let colorStyle = AbstractColorStyle.shared.getStyleColor(colors(rawValue: newColor)!)
        setColorStyle(colorStyle)
    }
    
    @IBAction func bayImacBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "showImacDevices", sender: nil)
    }
    
    
    
}
