//
//  main.swift
//  Exc_6
//
//  Created by Lsgsk on 30/09/2019.
//  Copyright © 2019 Lsgsk. All rights reserved.
//

import Foundation

let abs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

func caesarEncrypt(message: String, shift: Int) -> String {
	var secret = [Character]()
	for char in message {
		if let index = abs.firstIndex(of: char) {
			let distance = abs.distance(from: abs.startIndex, to: index)
			secret.append(abs[abs.index(abs.startIndex, offsetBy: (abs.count+distance+shift)%abs.count)])
		}
		else {
			secret.append(char)
		}
	}
	return String(secret)
}

func caesarDecrypt(message: String, shift: Int) -> String {
	var secret = [Character]()
	for char in message {
		if let index = abs.firstIndex(of: char) {
			let distance = abs.distance(from: abs.startIndex, to: index)
			secret.append(abs[abs.index(abs.startIndex, offsetBy: (abs.count+distance-shift)%abs.count)])
		}
		else {
			secret.append(char)
		}
	}
	return String(secret)
}



var message = "This is a secret message"
var encripted = caesarEncrypt(message: message, shift: 5)
var decripted = caesarDecrypt(message: encripted, shift: 5)
print(encripted + "\n" + decripted)

print(caesarEncrypt(message: "Nothing but gibberish", shift: 13))
