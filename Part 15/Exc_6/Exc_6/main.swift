import Foundation

var parcer = ExpressionParser()
print(try parcer.parse(expression: "3*4+5")?.evaluate() ?? "")
print(try parcer.parse(expression: "3+4*5")?.evaluate() ?? "")
print(try parcer.parse(expression: "(3+4)*5")?.evaluate() ?? "")
print(try parcer.parse(expression: "(8*3)+(20/(7–3))")?.evaluate() ?? "")
//print(parceExcression(expression: "3 * sin(0) + 1"))
//print(parceExcression(expression: "- ( 4 / 2)"))
print(try parseExpression(expression: "3 * 2"))
print(try parseExpression(expression: "(3 * 2)"))
