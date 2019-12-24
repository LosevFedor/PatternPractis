//
//  UserSettings.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 03/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class UserSettings: UITableViewController {

    @IBOutlet var generalTableView: UITableView!
    
    @IBOutlet weak var viewWithImage: UIView!
    @IBOutlet weak var viewWithStaticText: UIView!
    @IBOutlet weak var viewWithTextAboutUser: UIView!
    @IBOutlet weak var viewWithLogInBtn: UIView!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var styleTextLabel: UILabel!
    @IBOutlet weak var styleSwitch: UISwitch!
    
    @IBOutlet weak var aboutUserTextView: UITextView!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getUserParams()
        getUserColorStyle()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    private func getUserParams(){
        guard let image = userDefaults.data(forKey: "image") else { return }
        guard let email = userDefaults.string(forKey: "email") else { return }
        
        styleSwitch.isOn = userDefaults.bool(forKey: "swithState")
        userImage.image = UIImage(data: image)
        userEmailLabel.text = email
    }
    
    @IBAction func colorStyleSwitch(_ colorStyle: UISwitch) {
        if colorStyle.isOn {
            userDefaults.set("pink", forKey: "colorStyle")
            userDefaults.set(true, forKey: "swithState")
            let pinkColor = AbstractColorStyle.shared.getStyleColor(.pink)
            setColorStyle(pinkColor)
        }else{
            userDefaults.set("black", forKey: "colorStyle")
            userDefaults.set(false, forKey: "swithState")
            let blackColor = AbstractColorStyle.shared.getStyleColor(.black)
            setColorStyle(blackColor)
        }
    }
    
    func setColorStyle(_ colorStyle: ColorStyleProtocol){
        generalTableView.backgroundColor = colorStyle.nameColor
        
        viewWithImage.backgroundColor = colorStyle.nameColor
        viewWithStaticText.backgroundColor = colorStyle.nameColor
        viewWithTextAboutUser.backgroundColor = colorStyle.nameColor
        viewWithLogInBtn.backgroundColor = colorStyle.nameColor
        
        styleSwitch.tintColor = colorStyle.nameColor
        styleTextLabel.textColor = colorStyle.nameColor
        styleSwitch.backgroundColor = colorStyle.nameColor
        
    }
    
    func getUserColorStyle(){
        guard let newColor = UserDefaults.standard.string(forKey: "colorStyle") else { return }
       
        let swithState = UserDefaults.standard.bool(forKey: "swithState")
        styleSwitch.isOn = swithState
        
        
        
        let colorStyle = AbstractColorStyle.shared.getStyleColor(colors(rawValue: newColor)!)
        setColorStyle(colorStyle)
    }
    
    @IBAction func logOut(_ sender: Any) {
        LogInLogOut.standart.logoutUserParams()
        dismiss(animated: true, completion: nil)
    }

}
