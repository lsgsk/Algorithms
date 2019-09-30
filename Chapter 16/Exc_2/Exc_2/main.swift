import Foundation

func randomString(length: Int) -> String {
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	return String((0..<length).map { _ in letters.randomElement()! })
}

func checkMessageAndKey(message: String, code: String) {
	if message.count < code.count || Set(code).count != code.count || message.count % code.count != 0 {
		fatalError()
	}
}

func encrypt(message: String, code: String) -> String {
	checkMessageAndKey(message: message, code: code)
	var shifts = Array(repeating: 0, count: code.count)
	for (index, indexedChar) in code.enumerated() {
		for char in code where indexedChar != char && indexedChar > char {
			shifts[index] += 1
		}
	}
	let code = code.uppercased()
	let message = message.uppercased().components(separatedBy: .whitespacesAndNewlines).joined()
	var secret = [Character]()
	for row in 0..<(message.count / code.count) {
		for col in 0..<code.count {
			let index = row * code.count + shifts[col]
			secret.append(message[message.index(message.startIndex, offsetBy: index)])
		}
	}
	return String(secret)
}

func decrypt(message: String, code: String) -> String {
	checkMessageAndKey(message: message, code: code)
	var shifts = Array(repeating: 0, count: code.count)
	for (index, indexedChar) in code.enumerated() {
		for char in code where indexedChar != char && indexedChar > char {
			shifts[index] += 1
		}
	}
	let code = code.uppercased()
	let message = message.uppercased().components(separatedBy: .whitespacesAndNewlines).joined()
	var uncripted = [Character]()
	for row in 0..<(message.count / code.count) {
		for col in 0..<code.count {
			let index = row * code.count + shifts[col]
			uncripted.append(message[message.index(message.startIndex, offsetBy: index)])
		}
	}
	return String(uncripted)
}

var message = "This is a secret message!"
var encripted = encrypt(message: message, code: "carts")
var decripted = decrypt(message: encripted, code: "carts")
print(encripted + "\n" + decripted)
