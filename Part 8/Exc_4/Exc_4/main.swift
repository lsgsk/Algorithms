//
//  main.swift
//  Exc_4
//
//  Created by Lsgsk on 14.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var hash = LinearProbing()
hash.makeItems()
print("Find 20: \(hash.find(20) ?? "not found")")
print("Find 55: \(hash.find(20) ?? "not found")")
hash.insert(20, "Sasha")
hash.insert(88, "Sasha")
hash.insert(89, "Masha")
print(hash)

