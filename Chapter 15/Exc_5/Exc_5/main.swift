import Foundation

enum ExpressionError: Error {
	case incorrectExpression
}

enum ParseOperator: Comparable {
	case True
	case False
	case Disjunction // ИЛИ |
	case Conjunction // И &
	case Negation // НЕ -
	case Open
	case Close
	static func < (lhs: ParseOperator, rhs: ParseOperator) -> Bool {
		return lhs.priority < rhs.priority
	}
	private var priority: Int {
		switch self {
		case .Negation:
			return 3
		case .Conjunction:
			return 2
		case .Disjunction:
			return 1
		default:
			return 0
		}
	}
}

func evaluateBoolExpression(expression: String) throws -> Bool {
	func parceBoolExpression(expression: String) throws -> [ParseOperator] {
		var stack = [ParseOperator]()
		var queue = [ParseOperator]()
		
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
		
		for char in expression {
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
			case "&":
				insetOperation(.Conjunction)
			case "|":
				insetOperation(.Disjunction)
			case "-":
				insetOperation(.Negation)
			case "T":
				queue.append(.True)
			case "F":
				queue.append(.False)
			case " ":
				break
			default:
				throw ExpressionError.incorrectExpression
			}
		}
		
		while let operand = stack.popLast() {
			queue.append(operand)
		}
		return queue
	}
	
	func calculateBoolExpression(queue: [ParseOperator]) throws -> Bool {
		var stack = [Bool]()
		for operand in queue {
			switch operand {
			case .True:
				stack.append(true)
			case .False:
				stack.append(false)
			case .Negation:
				if let firstInStack = stack.popLast() {
					stack.append(!firstInStack)
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Conjunction, .Disjunction:
				if let firstInStack = stack.popLast(), let secondInStack = stack.popLast() {
					switch operand {
					case .Conjunction:
						stack.append(secondInStack && firstInStack)
					case .Disjunction:
						stack.append(secondInStack || firstInStack)
					default:
						break
					}
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Open, .Close:
				throw ExpressionError.incorrectExpression
			}
		}
		return stack[0]
	}
	let queue = try parceBoolExpression(expression: expression)
	return try calculateBoolExpression(queue: queue)
}

print(try evaluateBoolExpression(expression: "(F | T)"))
print(try evaluateBoolExpression(expression: "(T & -T)"))
print(try evaluateBoolExpression(expression: "T & ( -F | T )"))
