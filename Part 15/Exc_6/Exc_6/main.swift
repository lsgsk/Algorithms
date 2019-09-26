import Foundation

var parcer = ExpressionParser()
print(try parcer.convertExpressionToExecuteTree(expression: "3*4+5")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "3+4*5")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "(3+4)*5")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "(8*3)+(20/(7-3))")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "3 * sin(1) + 1")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "- ( 4 / 2)")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "3 * 2")?.evaluate() ?? "Error")
print(try parcer.convertExpressionToExecuteTree(expression: "(3 * 2)")?.evaluate() ?? "Error")
