import Cocoa

class ExpressionNode {
	let operand: Operators
	let value : Double?
	var leftOperand: ExpressionNode?
	var rightOperand: ExpressionNode?
	init(operand: Operators, value: Double? = nil) {
		self.operand = operand
		self.value = value
	}
	
	func evaluate() throws -> Double {
		switch operand {
		case .Literal:
			if let value = value {
				return value
			} else {
				throw TreeError.incorrectTree
			}
		case .Add:
			let opearands = try getOperands()
			return opearands.left + opearands.right
		case.Subtract:
			if let rightvalue = try rightOperand?.evaluate() {
				if let leftvalue = try leftOperand?.evaluate() {
					return leftvalue - rightvalue
				}
				else {
					return -rightvalue
				}
			}
			throw TreeError.incorrectTree
		case .Multiply:
			let opearands = try getOperands()
			return opearands.left * opearands.right
		case .Divide:
			let opearands = try getOperands()
			return opearands.left / opearands.right
		case .Sin:
			let rightvalue = try getRightOperand()
			return sin(rightvalue)
		case .Cos:
			let rightvalue = try getRightOperand()
			return cos(rightvalue)
		}
	}
	
	func getOperands() throws -> (left: Double, right: Double) {
		guard let leftvalue = try leftOperand?.evaluate(), let rightvalue = try rightOperand?.evaluate() else {
			throw TreeError.incorrectTree
		}
		return (leftvalue, rightvalue)
	}
	
	func getRightOperand() throws -> Double {
		guard let rightvalue = try rightOperand?.evaluate() else {
			throw TreeError.incorrectTree
		}
		return rightvalue
	}
}

enum Operators {
	case Literal
	case Add
	case Subtract
	case Multiply
	case Divide
	case Sin
	case Cos
}

enum TreeError: Error {
	case incorrectTree
}
