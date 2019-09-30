import Foundation

var parcer = ExpressionParser()
//print(try parcer.convertExpressionToExecuteTree(expression: "3*4+5")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "3+4*5")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "(3+4)*5")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "(8*3)+(20/(7-3))")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "3 * sin(1) + 1")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "- ( 4 / 2)")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "3 * 2")?.evaluate() ?? "Error")
//print(try parcer.convertExpressionToExecuteTree(expression: "(3 * 2)")?.evaluate() ?? "Error")

func findAllVariables(root: ExpressionNode) -> [ExpressionNode] {
	var array = [ExpressionNode]()
	func travers(_ node: ExpressionNode) {
		if let leftOperand = node.leftOperand {
			travers(leftOperand)
		}
		if case .Variable =  node.operand {
			array.append(node)
		}
		if let rightOperand = node.rightOperand {
			travers(rightOperand)
		}
	}
	travers(root)
	return array
}

if let root = try parcer.convertExpressionToExecuteTree(expression: "Y + (X * 2)") {
	let array = findAllVariables(root: root)
	try array.first(where: { $0.name == "Y" } )?.setVariable(3)
	try array.first(where: { $0.name == "X" } )?.setVariable(5)
	print(try root.evaluate())
}
