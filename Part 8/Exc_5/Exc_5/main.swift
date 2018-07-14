//
//  main.swift
//  Exc_4
//
//  Created by Lsgsk on 14.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var hash = QuadraticProbing()
hash.makeItems()
print(hash)
print("find 5: \(hash.find(5) ?? "Not found")")
print("find 29: \(hash.find(29) ?? "Not found")")



