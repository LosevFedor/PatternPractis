//
//  ImacDevices.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 19/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit


class ImacDevices: UIPageViewController {
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var addCabbot: UIBarButtonItem!
    
    lazy var subViewController: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImacVC21") as! ImacVC21,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImacVC27") as! ImacVC27
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        getUserColorStyle()
        setViewControllerFromIndex(index: 0)
    }
    
    func setColorStyle(_ colorStyle: ColorStyleProtocol){
        let navigationTitleColor = [NSAttributedString.Key.foregroundColor:colorStyle.nameColor]
        navigationController?.navigationBar.titleTextAttributes = navigationTitleColor
        backBtn.tintColor = colorStyle.nameColor
        addCabbot.tintColor = colorStyle.nameColor
    }
    
    func getUserColorStyle(){
        guard let newColor = UserDefaults.standard.string(forKey: "colorStyle") else { return }
        let colorStyle = AbstractColorStyle.shared.getStyleColor(colors(rawValue: newColor)!)
        setColorStyle(colorStyle)
    }
    
    
    func setViewControllerFromIndex(index: Int){
        self.setViewControllers([subViewController[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ImacDevices: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0{ return nil }
        return subViewController[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewController.count - 1{ return nil }
        return subViewController[currentIndex + 1]
    }
    
    
}
