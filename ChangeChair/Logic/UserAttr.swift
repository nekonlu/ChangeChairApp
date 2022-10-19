//
//  UserAttribute.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/18.
//  
//

import Foundation

struct UserAttr: Identifiable {
    var id = UUID()             // UUID
    var userID: Int             // 1つのchairTable内のuserごとに振り分けられたユニークな値
    var chairTable: [[Int]]     // 座標特定のために使う
    var name: String            // userの名前
}
