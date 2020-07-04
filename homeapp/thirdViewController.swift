//
//  thirdViewController.swift
//  homeapp
//
//  Created by 西山萌花 on 2020/07/02.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    
    @IBOutlet weak var commentLabel: UILabel!
    //ラベルの設定
    let label = UILabel()
    //label.font = UIFont(name:"fontname", size: 20.0)
    
    //コメントの配列
    var result:[String] = ["今度直接伝えてあげよう！","怒るよりほめるの心意気！","そこを見つけた君がすごい！","良いとこに目を向けてる君が最高に素敵","たまには自分もほめてあげてね","付箋や手紙で伝えてあげるのも○","その調子！どんどんほめ上手になるね","伝えるときは人前だともっと効果的！","発想の転換で短所も長所にしちゃおう","良いとこ探しで自分もハッピー！"]
    
    @IBAction func handleBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//ナビゲーションバーの非表示
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
        
        //ラベルをランダムで表示する
        let num = Int(arc4random_uniform(11))
        commentLabel.text = "\(result[num])"
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
