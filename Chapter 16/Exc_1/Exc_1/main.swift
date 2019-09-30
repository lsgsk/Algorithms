import Foundation

let tableLenght = 5

func randomString(length: Int) -> String {
	let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	return String((0..<length).map{ _ in letters.randomElement()! })
}

func encrypt(message: String) -> String {
	var message = message.uppercased().components(separatedBy: .whitespacesAndNewlines).joined()
	message += randomString(length: message.count%tableLenght)
	var secret = [Character]()
	let height = message.count / tableLenght
	for i in 0..<tableLenght {
		for j in 0..<height {
			let index = j * tableLenght + i
			secret.append(message[message.index(message.startIndex, offsetBy: index)])
		}
	}
	return String(secret)
}

func decrypt(message: String) -> String {
	var uncripted = [Character]()
	let height = message.count / tableLenght
	for i in 0..<tableLenght {
		for j in 0..<height {
			let index = j * height  + i
			uncripted.append(message[message.index(message.startIndex, offsetBy: index)])
		}
	}
	return String(uncripted)
}

var message = "This is a secret message"
var encripted = encrypt(message: message)
var decripted = decrypt(message: encripted)
print(encripted + "\n" + decripted)
