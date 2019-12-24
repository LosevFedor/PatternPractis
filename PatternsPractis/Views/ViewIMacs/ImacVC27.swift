//
//  ImacVC27.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 19/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class ImacVC27: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet var leftViewLine: UIView!
    @IBOutlet var rightViewLine: UIView!
    
    @IBOutlet weak var nameImacLabel: UILabel!
    @IBOutlet weak var imageImac: UIImageView!
    @IBOutlet weak var processorDescriptionLabel: UILabel!
    @IBOutlet weak var turboBoshDescriptionLabel: UILabel!
    @IBOutlet weak var ramDescriptionLabel: UILabel!
    @IBOutlet weak var hardDriveDescriptionLabel: UILabel!
    @IBOutlet weak var graphicsDescriptionLabel: UILabel!
    @IBOutlet weak var portDescriptionLabel: UILabel!
    @IBOutlet weak var displayDescriptionLabel: UILabel!
    @IBOutlet weak var praceLabel: UILabel!
    
    @IBOutlet weak var segmentButton: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imac = IMac()
        let myImac27 = imac.getAppleDevice(.imac27)
        setMyImacParams(show: myImac27)
        getUserColorStyle()
    }
    
    func setColorStyle(_ colorStyle: ColorStyleProtocol){
        leftViewLine.backgroundColor = colorStyle.nameColor
        rightViewLine.backgroundColor = colorStyle.nameColor
        nameImacLabel.textColor = colorStyle.nameColor
        processorDescriptionLabel.textColor = colorStyle.nameColor
        turboBoshDescriptionLabel.textColor = colorStyle.nameColor
        ramDescriptionLabel.textColor = colorStyle.nameColor
        hardDriveDescriptionLabel.textColor = colorStyle.nameColor
        graphicsDescriptionLabel.textColor = colorStyle.nameColor
        portDescriptionLabel.textColor = colorStyle.nameColor
        displayDescriptionLabel.textColor = colorStyle.nameColor
        praceLabel.textColor = colorStyle.nameColor
        segmentButton.backgroundColor = colorStyle.nameColor
    }
    
    func getUserColorStyle(){
        guard let newColor = UserDefaults.standard.string(forKey: "colorStyle") else { return }
        let colorStyle = AbstractColorStyle.shared.getStyleColor(colors(rawValue: newColor)!)
        setColorStyle(colorStyle)
    }
    
    func setMyImacParams(show iMac: ImacProtocol){
        nameImacLabel.text = iMac.name
        imageImac.image = iMac.image
        processorDescriptionLabel.text = iMac.processorDescription
        turboBoshDescriptionLabel.text = iMac.turboBoshDescription
        ramDescriptionLabel.text = iMac.ramDescription
        hardDriveDescriptionLabel.text = iMac.hardDriveDescription
        graphicsDescriptionLabel.text = iMac.graphicsDescription
        portDescriptionLabel.text = iMac.portsDescription
        displayDescriptionLabel.text = iMac.displayDescription
        praceLabel.text = iMac.price
    }
    
}
