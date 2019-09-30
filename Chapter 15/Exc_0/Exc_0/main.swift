import Foundation

func isPropertyNested(expression: String) -> Bool {
	var counter = 0
	for ch in expression {
		switch ch {
		case "(":
			counter += 1
		case ")":
			counter -= 1
			if counter < 0 { return false }
		default:
			break
		}
	}
	return counter == 0
}

print(isPropertyNested(expression: "()(())"))
print(isPropertyNested(expression: "())())"))
