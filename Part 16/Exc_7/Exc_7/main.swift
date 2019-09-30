//
//  main.swift
//  Exc_6
//
//  Created by Lsgsk on 30/09/2019.
//  Copyright © 2019 Lsgsk. All rights reserved.
//

import Foundation



func frequence(message: String) -> [Character: Int] {
	var collection = [Character: Int]()
	for char in message {
		if let value = collection[char] {
			collection[char] = value + 1
		}
		else {
			collection[char] = 1
		}
	}
	return collection
}

func frequencyShift(message: String) {
	let abs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	let message = message.uppercased()
	let freq = frequence(message: message).sorted() { $0.value > $1.value }
	
	let eShift = abs.firstIndex(of: "E")!
	print(freq.reduce("") { (r, arg1) -> String in
		if let index = abs.firstIndex(of: arg1.key) {
			return "\(r)\(arg1.key) \(arg1.value) \(eShift.utf16Offset(in: abs)-index.utf16Offset(in: abs))\n"
		}
		else {
			return r
		}
	})
}
var message = "This is a secret message"
frequencyShift(message: message)
