//
//  ExpressionTree.swift
//  Exc_0
//
//  Created by Lsgsk on 27.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class ExpressionNode{
    var operand: Operators
    var leftOperand: ExpressionNode?
    var rightOperand: ExpressionNode?
    var literalText : String?
    init(operand: Operators, literalText: String? = nil) {
        self.operand = operand
        self.literalText = literalText
    }
    
    func evaluate() throws -> Float{
        switch self.operand {
        case .Literal:
            guard let literal = self.literalText, let value = Float(literal) else {
                throw TreeError.incorrectTree
            }
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
        case .Factorial:
            guard let leftvalue = try leftOperand?.evaluate() else {
                throw TreeError.incorrectTree
            }
            return factorial(leftvalue)
        default:
            return 0.0
        }
    }
    
    func factorial(_ value: Float) -> Float{
        return (value <= 1) ? 1 : (value * factorial(value-1))
    }
    
    func getOperands() throws -> (left: Float, right: Float){
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
    case Negate
    case Factorial
}

enum TreeError: Error {
    case incorrectTree
}
