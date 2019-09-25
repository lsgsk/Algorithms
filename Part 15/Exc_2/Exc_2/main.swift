import Foundation

enum ParceOperator {
	case Literal(String)
	case Plus
	case Minus
	case Open
	case Close
}

func parceExcression(expression: String) {
	var operands = [ParceOperator]()
	var literal = ""
	var counter = 0
	
	func literalEnded() {
		if !literal.isEmpty {
			operands.append(.Literal(literal))
		}
		literal = ""
	}
	
	for ch in expression {
		switch ch {
		case "(":
			literalEnded()
			operands.append(.Open)
		case ")":
			literalEnded()
			operands.append(.Close)
		case "+":
			literalEnded()
			operands.append(.Plus)
		case "-":
			literalEnded()
			operands.append(.Minus)
		case _ where ch.isNumber:
			literal.append(ch)
		default:
			break
		}
	}
	literalEnded()
	
	func qwe(_ operands:[ParceOperator], _ pointer: inout Int) -> Int {
		while pointer < operands.count {
			let operand = operands[pointer]
			switch operand {
			case .Open:
				pointer += 1
				qwe(operands, &pointer)
			case .Literal(let number):
				if hasOperator {
					return Int(number)!
				}
				else {
					pointer += 1
				}
			case .Close:
				break
			case .Plus:
				if deep == 0 {
					var mp = pointer - 1
					var pp = pointer + 1
					return qwe(operands, &mp, true) + qwe(operands, &pp, true)
				}
				else {
					fatalError()
				}
			default:
				break
			}
		}
		return 0
	}
	var aaa = 0
	print(qwe(operands, &aaa))
}

//parceExcression(expression: "51+6")
parceExcression(expression: "(51+6)")

//"(8*3)+(20/(7-3))"

//var mathtree = ExpressionNode(operand: .Divide)
//mathtree.leftOperand = ExpressionNode(operand: .Times)
//mathtree.rightOperand = ExpressionNode(operand: .Plus)
//mathtree.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "6")
//mathtree.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "14")
//mathtree.rightOperand?.leftOperand =  ExpressionNode(operand: .Literal, literalText: "9")
//mathtree.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "12")
//print(try mathtree.evaluate())
