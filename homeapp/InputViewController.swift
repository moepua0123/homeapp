//
//  InputViewController.swift
//  homeapp
//
//  Created by 西山萌花 on 2020/07/02.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    
   // バーボタンアイテムの宣言
    var saveBarButtonItem: UIBarButtonItem!
    
    let realm = try! Realm()
    var save: Save!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //バーボタンアイテムの初期化
        saveBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveBarButtonTapped(_:)))
        //バーボタンの設置
        self.navigationItem.rightBarButtonItem = saveBarButtonItem
       
        //背景色の設定
        //view.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 1.0, alpha: 0.2)
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        nameTextField.text = save.name
        contentsTextView.text = save.contents

        
        // Do any additional setup after loading the view.
    }
    //doneボタンが押された時のメソッド
    @objc func saveBarButtonTapped(_ sender: UIBarButtonItem){
        try! realm.write {
                   self.save.name = self.nameTextField.text!
                   self.save.contents = self.contentsTextView.text
                   //self.task.date = self.datePicker.date
                   self.realm.add(self.save, update: .modified)
               }
        
        self.performSegue(withIdentifier: "tothird", sender: nil)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
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
