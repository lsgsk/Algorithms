import Foundation

class ExpressionParser {
	
	func convertExpressionToExecuteTree(expression: String) throws -> ExpressionNode? {
		let queue = try parceExpression(expression: expression)
		return try buildExpressionTree(queue: queue)
	}
	
	private func parceExpression(expression: String) throws -> Queue<ParseOperator> {
		var stack = [ParseOperator]()
		var queue = Queue<ParseOperator>()
		var numberLiteral = ""
		var funcLiteral = ""
		var hooksСounter = 0
		
		for char in expression {
			if !char.isNumber, !numberLiteral.isEmpty {
				if let value = Double(numberLiteral) {
					queue.enqueue(.Literal(value))
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
						queue.enqueue(existingInStackOperand)
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
				hooksСounter += 1
			case ")":
				while let oper = stack.popLast() {
					if case .Open = oper {
						// особый случай, когда скобки были частью функции, а не вложенности
						if let function = stack.popLast() {
							switch function {
							case .Sin, .Cos:
								queue.enqueue(function)
							default:
								stack.append(function)
							}
						}
						break
					}
					else {
						queue.enqueue(oper)
					}
				}
				hooksСounter -= 1
				if hooksСounter < 0 { throw ExpressionError.incorrectExpression }
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
				queue.enqueue(.Literal(value))
				numberLiteral = ""
			}
			else {
				throw ExpressionError.incorrectNumberValue
			}
		}
		
		while let operand = stack.popLast() {
			queue.enqueue(operand)
		}
		if hooksСounter > 0 { throw ExpressionError.incorrectExpression }
		return queue
	}
	
	private func buildExpressionTree(queue: Queue<ParseOperator>) throws -> ExpressionNode? {
		let stack = Stack<ExpressionNode>()
		while let operand = queue.dequeue() {
			
			//сюда проверку на кол-во аргументов
			
			switch operand {
			case .Literal(let value):
				stack.push(ExpressionNode(operand: .Literal, value: value))
			case .Add, .Multiply, .Divide:
				if let firstInStackNode = stack.pop(), let secondInStackNode = stack.pop()  {
					var node: ExpressionNode? = nil
					switch operand {
					case .Add:
						node = ExpressionNode(operand: .Add)
					case .Multiply:
						node = ExpressionNode(operand: .Multiply)
					case .Divide:
						node = ExpressionNode(operand: .Divide)
					default:
						break
					}
					if let node = node {
						node.leftOperand = secondInStackNode
						node.rightOperand = firstInStackNode
						stack.push(node)
					}
					else {
						throw ExpressionError.incorrectExpression
					}
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Subtract:
				if let firstInStackNode = stack.pop() {
					let node = ExpressionNode(operand: .Subtract)
					node.rightOperand = firstInStackNode
					if let secondInStackNode = stack.pop() {
						node.leftOperand = secondInStackNode
					}
					stack.push(node)
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Sin:
				if let firstInStackNode = stack.pop() {
					let node = ExpressionNode(operand: .Sin)
					node.rightOperand = firstInStackNode
					stack.push(node)
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Cos:
				if let firstInStackNode = stack.pop() {
					let node = ExpressionNode(operand: .Cos)
					node.rightOperand = firstInStackNode
					stack.push(node)
				}
				else {
					throw ExpressionError.incorrectExpression
				}
			case .Open, .Close:
				break
			}
		}
		return stack.pop()
	}
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

enum ExpressionError: Error {
	case incorrectExpression
	case incorrectNumberValue
	case unknownFunction
}
