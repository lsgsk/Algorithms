import Foundation

enum ParceOperator {
	case Literal(String)
	case Plus
	case Multiply
	//case Open
	//case Close
	
	var priority: Int {
		switch self {
		case .Multiply:
			return 3
		case .Plus:
			return 2
		case.Literal:
			return 0
		}
	}
}

func parceExcression(expression: String) throws -> ExpressionNode? {
	var operands = [ParceOperator]()
	var literal = ""
	var counter = 0
	
	func literalEnded() {
		if !literal.isEmpty {
			operands.append(.Literal(literal))
			literal = ""
		}
	}
	
	for ch in expression {
		switch ch {
		case "+":
			literalEnded()
			operands.append(.Plus)
		case "*":
			literalEnded()
			operands.append(.Multiply)
		case _ where ch.isNumber:
			literal.append(ch)
		default:
			break
		}
	}
	literalEnded()
	
	func qwe(_ operands:[ParceOperator]) -> [ParceOperator]{
		
		var queue = [ParceOperator]()
		let stack = Stack<ParceOperator>()
		
		for operand in operands {
			switch operand {
			case .Literal:
				queue.append(operand)
			case .Plus, .Multiply:
				if let exist = stack.pop() {
					if operand.priority <= exist.priority {
						queue.append(exist)
					}
					else {
						stack.push(exist)
					}
					stack.push(operand)
				}
				else {
					stack.push(operand)
				}
			}
		}
		while let operand = stack.pop() {
			queue.append(operand)
		}
		return queue
	}
	func tree(_ queue: [ParceOperator], _ index: Int) -> ExpressionNode? {
		if index>=0 {
			let operand = queue[index]
			switch operand {
			case .Literal(let value):
				return ExpressionNode(operand: .Literal, literalText: value)
			case .Plus:
				let node = ExpressionNode(operand: .Plus)
				node.leftOperand = tree(queue, index - 2)
				node.rightOperand = tree(queue, index - 1)
				return node
			case .Multiply:
				let node = ExpressionNode(operand: .Times)
				node.leftOperand = tree(queue, index - 2)
				node.rightOperand = tree(queue, index - 1)
				return node
			}
		}
		return nil
	}
	var queue = qwe(operands)
	let tr = tree(queue, queue.count-1)
	return tr
}

//print(try parceExcression(expression: "3*4+5")?.evaluate() ?? "")
print(try parceExcression(expression: "3+4*5")?.evaluate() ?? "")
