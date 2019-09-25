import Cocoa

class ExpressionNode {
	var operand: Operators
	var leftOperand: ExpressionNode?
	var rightOperand: ExpressionNode?
	var literalText : String?
	init(operand: Operators, literalText: String? = nil) {
		self.operand = operand
		self.literalText = literalText
	}
	
	func evaluate() throws -> Float{
		switch operand {
		case .Literal:
			guard let literal = literalText, let value = Float(literal) else { throw TreeError.incorrectTree }
			return value
		case .Plus:
			let opearands = try getOperands()
			return opearands.left + opearands.right
		case.Minus:
			let opearands = try getOperands()
			return opearands.left - opearands.right
		case .Times:
			let opearands = try getOperands()
			return opearands.left * opearands.right
		case .Divide:
			let opearands = try getOperands()
			return opearands.left / opearands.right
		}
	}
	
	func getOperands() throws -> (left: Float, right: Float) {
		guard let leftvalue = try leftOperand?.evaluate(), let rightvalue = try rightOperand?.evaluate() else {
			throw TreeError.incorrectTree
		}
		return (leftvalue, rightvalue)
	}
}

enum Operators {
	case Literal
	case Plus
	case Minus
	case Times
	case Divide
}

enum TreeError: Error {
	case incorrectTree
}
