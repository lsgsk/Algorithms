import Foundation

enum ExpressionError: Error {
	case incorrectExpression
	case incorrectNumberValue
	case unknownFunction
}

enum ParseOperator: Comparable {
	case Literal(Double)
	case Add
	case Subtract
	case Multiply
	case Divide
	case Sin
	case Cos
	case Open
	case Close
	
	static func < (lhs: ParseOperator, rhs: ParseOperator) -> Bool {
		return lhs.priority < rhs.priority
	}
	private var priority: Int {
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

func evaluateExpression(expression: String) throws -> Double {
	var stack = [ParseOperator]()
	var queue = [ParseOperator]()
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
		//игры с приоритетом для + и *
		func insetOperation(_ newOperand: ParseOperator) {
			if let existingInStackOperand = stack.popLast() {
				if newOperand <= existingInStackOperand {
					queue.append(existingInStackOperand)
				}
				else {
					stack.append(existingInStackOperand)
				}
				stack.append(newOperand)
			}
			else {
				stack.append(newOperand)
			}
		}
		
		switch char {
		case "(":
			stack.append(.Open)
		case ")":
			while let oper = stack.popLast() {
				if case .Open = oper {
					// особый случай, когда скобки были частью функции, а не вложенности
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
			insetOperation(.Add)
		case "-":
			insetOperation(.Subtract)
		case "*":
			insetOperation(.Multiply)
		case "/":
			insetOperation(.Divide)
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
			else {
				throw ExpressionError.incorrectExpression
			}
		case .Cos:
			if let firstInStack = resultStack.popLast() {
				resultStack.append(cos(firstInStack))
			}
			else {
				throw ExpressionError.incorrectExpression
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
			else {
				throw ExpressionError.incorrectExpression
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
			else {
				throw ExpressionError.incorrectExpression
			}
		case .Open, .Close:
			throw ExpressionError.incorrectExpression//тут уже быть не должно
		}
	}
	return resultStack[0]
}

print(try evaluateExpression(expression: "3 * sin(1) + 1"))
 print(try evaluateExpression(expression: "- ( 4 / 2)"))
