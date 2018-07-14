//
//  main.swift
//  Exc_6
//
//  Created by Lsgsk on 14.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation
var hash = PseudoRandomProbing()
hash.makeItems()
print(hash)
print("Find 96: \(hash.find(96) ?? "not found")")

