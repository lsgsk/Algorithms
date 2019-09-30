//
//  main.swift
//  Exc_9
//
//  Created by Lsgsk on 30/09/2019.
//  Copyright © 2019 Lsgsk. All rights reserved.
//

import Foundation

let abs = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")

func vigenèreEncrypt(message: String, key: String) -> String {
	let key = Array(key.uppercased())
	let message = Array(message.uppercased())
	var secret = [Character]()
	for (index, char) in message.enumerated() {
		if char.isLetter, let keyCharIndex = abs.firstIndex(of: key[index%key.count]), let mesIndex = abs.firstIndex(of: char) {
			secret.append(abs[(mesIndex + keyCharIndex)%abs.count])
		}
		else {
			secret.append(char)
		}
	}
	return String(secret)
}

func vigenèreDecrypt(message: String, key: String) -> String {
	let key = Array(key.uppercased())
	let message = Array(message.uppercased())
	var secret = [Character]()
	for (index, char) in message.enumerated() {
		if char.isLetter, let keyCharIndex = abs.firstIndex(of: key[index%key.count]), let mesIndex = abs.firstIndex(of: char) {
			secret.append(abs[(abs.count + mesIndex - keyCharIndex)%abs.count])
		}
		else {
			secret.append(char)
		}
	}
	return String(secret)
}


var message = "This is a secret message"
var encripted = vigenèreEncrypt(message: message, key: "AFZ")
var decripted = vigenèreDecrypt(message: encripted, key: "AFZ")
print(encripted + "\n" + decripted)
print(vigenèreDecrypt(message: "VDOKR RVVZK OTUII MNUUV RGFQK TOGNX VHOPG RPEVW VZYYO WKMOC ZMBR", key: "VIGENERE"))
