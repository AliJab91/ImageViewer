//
//  MyPageViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/9/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    var viewControllerArray : [UIViewController]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setPageViews()
        // Do any additional setup after loading the view.
    }
// MARK: setting views
    func setPageViews()  {
        let firstView = self.storyboard?.instantiateViewController(withIdentifier: "FirstView")
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: "SecondView")
        self.viewControllerArray = [firstView!,secondView!];
        self.setViewControllers([firstView!], direction: .forward, animated: true , completion: nil)
    }
}

    // MARK: PageViewController functions

extension MyPageViewController :UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if self.viewControllerArray.index(of: viewController) == 0{
            return nil
        }else {
             return self.viewControllerArray[self.viewControllerArray.index(of: viewController)! - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if self.viewControllerArray.index(of: viewController) == self.viewControllerArray.count - 1{
            return nil
        }
        return self.viewControllerArray[self.viewControllerArray.index(of: viewController)!+1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.viewControllerArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllerArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
