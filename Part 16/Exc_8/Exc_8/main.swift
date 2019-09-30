import Foundation

let abs = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

func caesarEncrypt(message: String, shift: Int) -> String {
	let message = message.uppercased()
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

for i in 0..<abs.count {
	print("\(i) \(caesarDecrypt(message: "KYVIV NRJRK ZDVNY VETRV JRIJL SJKZK LKZFE NRJKY VJKRK VFWKY VRIK", shift: i))")
}


print(caesarDecrypt(message: "KYVIV NRJRK ZDVNY VETRV JRIJL SJKZK LKZFE NRJKY VJKRK VFWKY VRIK", shift: 17))

