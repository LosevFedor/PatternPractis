//
//  ViewController.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 15/11/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class RegistrateVC: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    private let userDefaults = UserDefaults.standard
    private var pickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        pickerController.sourceType = .savedPhotosAlbum
        pickerController.allowsEditing = true
        
        if LogInLogOut.standart.sendRegistratedUserToHomeView(){
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "home", sender: nil)
            }
        }
        setImageLayer()
        
        let tapedToImage = UITapGestureRecognizer(target: self, action: #selector(handlerPresentUserPhoto))
        view.addGestureRecognizer(tapedToImage)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("NO image found")
            return
        }
        self.userImage.image = image
    }
    
    @objc func handlerPresentUserPhoto(tapped: UITapGestureRecognizer){
        present(pickerController, animated: true, completion: nil)
    }
    
    fileprivate func setUserDefaultSettings() {
        User.shared.userColorStyle = "pink"
        User.shared.userSwithState = true
    }
    
    @IBAction func registrateByEmailBtnPressed(_ sender: Any) {
        guard let image = userImage.image?.pngData() else{ return }
        guard let email = userEmail.text else{ return }
        guard let password = userPassword.text else{ return }
        
        if checkFields(email, password) {
            
            User.shared.image = image
            User.shared.email = email
            User.shared.password = password
            
            setUserDefaultSettings()
            
            LogInLogOut.standart.saveUserParams()
            
            performSegue(withIdentifier: "home", sender: nil)
        }else{
            print("Some fields not fulling")
        }
    }
    
    private func checkFields(_ email: String, _ password: String) -> Bool{
        if email != "" && password != ""{
            return true
        }
        return false
    }
    
    
    private func setImageLayer(){
        userImage.layer.cornerRadius = 50
        userImage.layer.borderWidth = 3
        userImage.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}

