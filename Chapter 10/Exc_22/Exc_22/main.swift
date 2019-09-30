import Foundation
/*
var exc1 = ExpressionNode(operand: .Plus)
exc1.leftOperand = ExpressionNode(operand: .Divide)
exc1.rightOperand = ExpressionNode(operand: .Divide)
exc1.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "15")
exc1.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "3")
exc1.rightOperand?.leftOperand =  ExpressionNode(operand: .Literal, literalText: "24")
exc1.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "6")
print(try exc1.evaluate())

var exc2 = ExpressionNode(operand: .Times)
exc2.leftOperand = ExpressionNode(operand: .Minus)
exc2.rightOperand = ExpressionNode(operand: .Times)
exc2.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "8")
exc2.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "12")
exc2.rightOperand?.leftOperand =  ExpressionNode(operand: .Literal, literalText: "14")
exc2.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "32")
print(try exc2.evaluate())

var exc3 = ExpressionNode(operand: .Plus)
exc3.leftOperand = ExpressionNode(operand: .Plus)
exc3.rightOperand = ExpressionNode(operand: .Divide)
exc3.leftOperand?.leftOperand = ExpressionNode(operand: .Divide)
exc3.leftOperand?.rightOperand = ExpressionNode(operand: .Divide)
exc3.leftOperand?.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "1")
exc3.leftOperand?.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "2")
exc3.leftOperand?.rightOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "1")
exc3.leftOperand?.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "4")
exc3.rightOperand?.leftOperand =  ExpressionNode(operand: .Literal, literalText: "1")
exc3.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "20")
print(try exc3.evaluate())

var exc4 = ExpressionNode(operand: .Divide)
exc4.leftOperand = ExpressionNode(operand: .Times)
exc4.rightOperand = ExpressionNode(operand: .Times)
exc4.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "36")
exc4.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "2")
exc4.rightOperand?.leftOperand =  ExpressionNode(operand: .Literal, literalText: "9")
exc4.rightOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "32")
print(try exc4.evaluate())*/

var exc5 = ExpressionNode(operand: .Divide)
exc5.leftOperand = ExpressionNode(operand: .Factorial)
exc5.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "5")

exc5.rightOperand = ExpressionNode(operand: .Times)
exc5.rightOperand?.leftOperand = ExpressionNode(operand: .Factorial)
exc5.rightOperand?.rightOperand = ExpressionNode(operand: .Factorial)
exc5.rightOperand?.leftOperand?.leftOperand = ExpressionNode(operand: .Minus)

exc5.rightOperand?.leftOperand?.leftOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "5")
exc5.rightOperand?.leftOperand?.leftOperand?.rightOperand = ExpressionNode(operand: .Literal, literalText: "3")

exc5.rightOperand?.rightOperand?.leftOperand = ExpressionNode(operand: .Literal, literalText: "3")

print(try exc5.evaluate())

