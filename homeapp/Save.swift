//
//  Save.swift
//  homeapp
//
//  Created by 西山萌花 on 2020/07/02.
//  Copyright © 2020 moeka.nishiyama. All rights reserved.
//

import Foundation

import RealmSwift

class Save: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // タイトル
    @objc dynamic var name = ""

    // 内容
    @objc dynamic var contents = ""

    // 日時
    @objc dynamic var date = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}

