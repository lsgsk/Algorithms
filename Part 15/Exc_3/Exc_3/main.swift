import Foundation

enum ParceOperator {
	case Literal(String)
	case Add
	case Subtract
	case Multiply
	case Divide
	case Open
	case Close
	
	var priority: Int {
		switch self {
		case .Multiply, .Divide:
			return 3
		case .Add, .Subtract:
			return 2
		default:
			return 0
		}
	}
}

func parceExcression(expression: String) -> Int {
	var stack = [ParceOperator]()
	var queue = [ParceOperator]()
	var literal = ""
	
	for char in expression {
		if !char.isNumber, !literal.isEmpty {
			queue.append(.Literal(literal))
			literal = ""
		}
		switch char {
		case "(":
			stack.append(.Open)
		case ")":
			while let oper = stack.popLast() {
				if case .Open = oper {
					break
				}
				else {
					queue.append(oper)
				}
			}
		case "+":
			stack.append(.Add)
		case "-":
			stack.append(.Subtract)
		case "*":
			stack.append(.Multiply)
		case "/":
			stack.append(.Divide)
		case _ where char.isNumber:
			literal.append(char)
		default:
			break
		}
	}
	if !literal.isEmpty {
		queue.append(.Literal(literal))
	}
	
	while let operand = stack.popLast() {
		queue.append(operand)
	}
	
	var resultStack = [Int]()
	for operand in queue {
		switch operand {
		case .Literal(let value):
			if let number = Int(value) {
				resultStack.append(number)
			}
		case .Add, .Subtract, .Multiply, .Divide:
			if let firstInStack = resultStack.popLast(), let secondInStack = resultStack.popLast()  {
				var result = 0
				switch operand {
				case .Add:
					result = secondInStack + firstInStack
				case .Subtract:
					result = secondInStack - firstInStack
				case .Multiply:
					result = secondInStack * firstInStack
				case .Divide:
					result = secondInStack / firstInStack
				default:
					break
				}
				resultStack.append(result)
			}
		default:
			break
		}
	}
	return resultStack[0]
}
print(parceExcression(expression: "-(2/7)"))
