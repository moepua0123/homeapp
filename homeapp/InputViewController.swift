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
    
    let realm = try! Realm()
    var save: Save!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        nameTextField.text = save.name
        contentsTextView.text = save.contents

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.save.name = self.nameTextField.text!
            self.save.contents = self.contentsTextView.text
            //self.task.date = self.datePicker.date
            self.realm.add(self.save, update: .modified)
        }

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
