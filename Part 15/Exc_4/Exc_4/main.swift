import Foundation

enum ExpressionError: Error {
	case incorrectExpression
	case incorrectNumberValue
	case unknownFunction
}

enum ParceOperator {
	case Literal(Double)
	case Add
	case Subtract
	case Multiply
	case Divide
	case Sin
	case Cos
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

func parceExcression(expression: String) throws -> Double {
	var stack = [ParceOperator]()
	var queue = [ParceOperator]()
	var numberLiteral = ""
	var funcLiteral = ""
	
	for char in expression {
		if !char.isNumber, !numberLiteral.isEmpty {
			if let value = Double(numberLiteral) {
				queue.append(.Literal(value))
				numberLiteral = ""
			}
			else {
				throw ExpressionError.incorrectNumberValue
			}
		}
		if !char.isLetter, !funcLiteral.isEmpty {
			switch funcLiteral.lowercased() {
			case "sin":
				stack.append(.Sin)
			case "cos":
				stack.append(.Cos)
			default:
				throw ExpressionError.unknownFunction
			}
			funcLiteral = ""
		}
		switch char {
		case "(":
			stack.append(.Open)
		case ")":
			while let oper = stack.popLast() {
				if case .Open = oper {
					if let function = stack.popLast() {
						switch function {
						case .Sin, .Cos:
							queue.append(function)
						default:
							stack.append(function)
						}
					}
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
			numberLiteral.append(char)
		case _ where char.isLetter:
			funcLiteral.append(char)
		default:
			break
		}
	}
	if !numberLiteral.isEmpty {
		if let value = Double(numberLiteral) {
			queue.append(.Literal(value))
			numberLiteral = ""
		}
		else {
			throw ExpressionError.incorrectNumberValue
		}
	}
	
	while let operand = stack.popLast() {
		queue.append(operand)
	}
	
	var resultStack = [Double]()
	for operand in queue {
		switch operand {
		case .Literal(let value):
			
			resultStack.append(value)
			
		case .Sin:
			if let firstInStack = resultStack.popLast() {
				resultStack.append(sin(firstInStack))
			}
		case .Cos:
			if let firstInStack = resultStack.popLast() {
				resultStack.append(cos(firstInStack))
			}
		case .Add, .Multiply, .Divide:
			if let firstInStack = resultStack.popLast(), let secondInStack = resultStack.popLast()  {
				var result = 0.0
				switch operand {
				case .Add:
					result = secondInStack + firstInStack
				case .Multiply:
					result = secondInStack * firstInStack
				case .Divide:
					result = secondInStack / firstInStack
				default:
					break
				}
				resultStack.append(result)
			}
		case .Subtract:
			if let firstInStack = resultStack.popLast() {
				var result = 0.0
				if let secondInStack = resultStack.popLast() {
					result = secondInStack - firstInStack
				}
				else {
					result = -firstInStack
				}
				resultStack.append(result)
			}
		default:
			break
		}
	}
	return resultStack[0]
}

print(try parceExcression(expression: "3*4+5"))
print(try parceExcression(expression: "3+4*5"))

//print(parceExcression(expression: "3 * sin(0) + 1"))


