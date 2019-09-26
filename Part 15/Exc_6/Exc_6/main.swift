import Foundation

var parcer = ExpressionParser()
print(try parcer.parse(expression: "3*4+5")?.evaluate() ?? "")
print(try parcer.parse(expression: "3+4*5")?.evaluate() ?? "")
print(try parcer.parse(expression: "(3+4)*5")?.evaluate() ?? "")
print(try parcer.parse(expression: "(8*3)+(20/(7–3))")?.evaluate() ?? "")
