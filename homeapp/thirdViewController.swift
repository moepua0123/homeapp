//
//  thirdViewController.swift
//  homeapp
//
//  Created by 西山萌花 on 2020/07/02.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    @IBAction func handleBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//ナビゲーションバーの非表示
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
