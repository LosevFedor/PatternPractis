//
//  PageVC.swift
//  PatternsPractis
//
//  Created by Лосев Фёдор Александрович on 15/12/2019.
//  Copyright © 2019 Лосев Фёдор Александрович. All rights reserved.
//

import UIKit

class AppleDevicesVC: UIPageViewController {

    lazy var subViewController: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IMakVC") as! IMakVC,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IPadVC") as! IPadVC,
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "IPhoneVC") as! IPhoneVC
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.dataSource = self
        
        setViewControllerFromIndex(index: 0)
    }
    
    func setViewControllerFromIndex(index: Int){
        self.setViewControllers([subViewController[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }

}

extension AppleDevicesVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0{ return nil }
        return subViewController[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewController.firstIndex(of: viewController) ?? 0
        if currentIndex >= subViewController.count - 1{ return nil }
        return subViewController[currentIndex+1]
    }
    
    
}
