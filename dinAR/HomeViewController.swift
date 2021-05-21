//
//  HomeViewController.swift
//  dinAR
//
//  Created by Aaryaman Saini on 15/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var globalButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        let barColor = UIColor(red:0.25, green:0.56, blue:0.49, alpha:1)
        let barTitleColor = UIColor(red:0.98, green:0.91, blue:0.82, alpha:1)
           
        let navigationBar = self.navigationController?.navigationBar

        globalButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        globalButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.5)
        globalButton.layer.shadowOpacity = 1.0
        globalButton.layer.shadowRadius = 0.0
        globalButton.layer.masksToBounds = false
        globalButton.layer.cornerRadius = 25.0
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: barTitleColor]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: barTitleColor]
            
            navBarAppearance.backgroundColor = barColor
            navigationBar?.standardAppearance = navBarAppearance
            navigationBar?.scrollEdgeAppearance = navBarAppearance
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
       
    }

}
