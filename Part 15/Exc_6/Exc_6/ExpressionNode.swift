import Cocoa

class ExpressionNode {
	let operand: Operators
	let name: String?
	private(set) var value: Double?
	var leftOperand: ExpressionNode?
	var rightOperand: ExpressionNode?
	init(operand: Operators, value: Double? = nil, name: String? = nil) {
		self.operand = operand
		self.value = value
		self.name = name
	}
	
	func setVariable(_ value: Double) throws {
		if case .Variable = operand {
			self.value = value
		}
		else {
			throw TreeError.impossibleToSetVariable
		}
	}
	
	func evaluate() throws -> Double {
		switch operand {
		case .Literal:
			if let value = value {
				return value
			} else {
				throw TreeError.incorrectTree
			}
		case .Variable:
			if let value = value {
				return value
			} else {
				throw TreeError.variableNotSetted
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
	case Variable
	case Add
	case Subtract
	case Multiply
	case Divide
	case Sin
	case Cos
}

enum TreeError: Error {
	case incorrectTree
	case impossibleToSetVariable
	case variableNotSetted
}
