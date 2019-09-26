import Foundation

class ExpressionParser {
	
	func parse(expression: String) throws -> ExpressionNode? {
		let operands = try devideToOperations(expression: expression)
		var queue = buildReversePolishNotation(operands)
		let tr = buildExpressionTree(&queue)
		return tr
	}
	
	private func devideToOperations(expression: String) throws -> [ParseOperator] {
		var operands = [ParseOperator]()
		var literal = ""
		var hooksСounter = 0
		
		func literalFinished() {
			if !literal.isEmpty {
				operands.append(.Literal(literal))
				literal = ""
			}
		}
		
		for ch in expression {
			switch ch {
			case "(":
				literalFinished()
				operands.append(.Open)
				hooksСounter += 1
			case ")":
				literalFinished()
				operands.append(.Close)
				hooksСounter -= 1
				if hooksСounter < 0 { throw ExpressionError.incorrectExpression }
			case "+":
				literalFinished()
				operands.append(.Plus)
			case "*":
				literalFinished()
				operands.append(.Multiply)
			case _ where ch.isNumber:
				literal.append(ch)
			default:
				break
			}
		}
		literalFinished()
		if hooksСounter > 0 { throw ExpressionError.incorrectExpression }
		return operands
	}
	
	private func buildReversePolishNotation(_ operands: [ParseOperator]) -> Queue<ParseOperator>{
		let queue = Queue<ParseOperator>()
		let stack = Stack<ParseOperator>()
		for operand in operands {
			switch operand {
			case .Literal:
				queue.enqueue(operand)
			case .Plus, .Multiply, .Minus, .Divide:
				if let exist = stack.pop() {
					if operand <= exist {
						queue.enqueue(exist)
					}
					else {
						stack.push(exist)
					}
					stack.push(operand)
				}
				else {
					stack.push(operand)
				}
			case .Open:
				stack.push(operand)
			case .Close:
				var qwe = true
				while qwe, let item = stack.pop() {
					switch item {
					case .Open:
						qwe = false
					default:
						queue.enqueue(item)
					}
				}
			}
		}
		while let operand = stack.pop() {
			queue.enqueue(operand)
		}
		return queue
	}
	
	private func buildExpressionTree(_ queue: inout Queue<ParseOperator>) -> ExpressionNode? {
		while let operand = queue.pop()  {
			switch operand {
			case .Literal(let value):
				return ExpressionNode(operand: .Literal, literalText: value)
			case .Plus:
				let node = ExpressionNode(operand: .Plus)
				node.leftOperand = buildExpressionTree(&queue)
				node.rightOperand = buildExpressionTree(&queue)
				return node
			case .Multiply:
				let node = ExpressionNode(operand: .Times)
				node.leftOperand = buildExpressionTree(&queue)
				node.rightOperand = buildExpressionTree(&queue)
				return node
			case .Open, .Close:
				break
			case .Minus:
				let node = ExpressionNode(operand: .Minus)
				node.leftOperand = buildExpressionTree(&queue)
				node.rightOperand = buildExpressionTree(&queue)
			case .Divide:
				let node = ExpressionNode(operand: .Divide)
				node.leftOperand = buildExpressionTree(&queue)
				node.rightOperand = buildExpressionTree(&queue)
			}
		}
		return nil
	}
}

enum ParseOperator: Comparable {
	case Literal(String)
	case Plus
	case Minus
	case Multiply
	case Divide
	case Open
	case Close
	static func < (lhs: ParseOperator, rhs: ParseOperator) -> Bool {
		return lhs.priority < rhs.priority
	}
	private var priority: Int {
		switch self {
		case .Multiply, .Divide:
			return 3
		case .Plus, .Minus:
			return 2
		default:
			return 0
		}
	}
}

enum ExpressionError: Error {
	case incorrectExpression
}
