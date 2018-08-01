//
//  BNode.swift
//  Exc_0
//
//  Created by Lsgsk on 30.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class BNode {
    let degree = 3
    var parent: BNode?
    var children : [BNode?]
    var keys : [Int?]
    var count : Int{ get{ return keys.compactMap({$0}).count } }
    var countChildrens: Int{ get { return children.compactMap({$0}).count} }
    init() {
        self.parent = nil
        self.children = Array(repeating: nil, count: degree)
        self.keys = Array(repeating: nil, count: degree + 1)
    }
}
