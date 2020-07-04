//
//  ViewController.swift
//  homeapp
//
//  Created by 西山萌花 on 2020/07/02.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    @IBOutlet weak var SearchBar: UISearchBar!
    var searchResult = [String]()
    
    var saveArray = try! Realm().objects(Save.self).sorted(byKeyPath: "date", ascending: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        SearchBar.delegate = self
        SearchBar.enablesReturnKeyAutomatically = false
        
        //ナビゲーションバーの色の設定
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1.0, green: 0.8, blue: 1.0, alpha: 0.2)
        
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.titleTextAttributes = [
        // 文字の色
            .foregroundColor: UIColor.white
        ]
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveArray.count
    }

    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Cellに値を設定する.
        let save = saveArray[indexPath.row]
        cell.textLabel?.text = save.name
        cell.detailTextLabel?.text = save.contents
        cell.imageView?.image      = UIImage(named: "medal.jpeg")
        
        //let formatter = DateFormatter()
        //formatter.dateFormat = "yyyy-MM-dd HH:mm"

        //let dateString:String = formatter.string(from: task.date)
        //cell.detailTextLabel?.text = dateString
        
        
        return cell
    }

    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil)
    }

    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return .delete
    }

    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // データベースから削除する
            try! realm.write {
                self.realm.delete(self.saveArray[indexPath.row])
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    //画面遷移の時にデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let inputViewController:InputViewController = segue.destination as! InputViewController

        if segue.identifier == "cellSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            inputViewController.save = saveArray[indexPath!.row]
        } else {
            let save = Save()

            let allSaves = realm.objects(Save.self)
            if allSaves.count != 0 {
                save.id = allSaves.max(ofProperty: "id")! + 1
            }

            inputViewController.save = save
        }
    }

    // 戻ってきた時に TableView を更新させる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //サーチバーの設置
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           print("")
           //nameの中からサーチバーに書かれたテキストを検索する
           let predicate = NSPredicate(format:  "name = %@",SearchBar.text!)
           //taskArray（一覧）に検索結果を代入して、Table Viewを再構築する
           saveArray = realm.objects(Save.self) .filter(predicate)
           //tableViewにデータ表示する
           tableView.reloadData()
    }
       
       
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           //キャンセルを押した時に条件もない全部のタスクを表示する
           saveArray = realm.objects(Save.self).sorted(byKeyPath: "date", ascending: false)
           tableView.reloadData()
           
    }

}

