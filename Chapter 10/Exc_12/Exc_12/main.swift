import Foundation

print("Hello, World!")
var nodeA = BinaryNode("A")
var nodeB = BinaryNode("B")
var nodeC = BinaryNode("C")
var nodeD = BinaryNode("D")
var nodeE = BinaryNode("E")
var nodeF = BinaryNode("F")
var nodeG = BinaryNode("G")
var nodeH = BinaryNode("H")
var nodeI = BinaryNode("I")
var nodeJ = BinaryNode("J")
var root = nodeE

nodeE.leftChild = nodeB
nodeE.rightChild = nodeF
nodeB.leftChild = nodeA
nodeB.rightChild = nodeD
nodeD.leftChild = nodeC
nodeF.rightChild = nodeI
nodeI.leftChild = nodeG
nodeI.rightChild = nodeJ
nodeG.rightChild = nodeH

print(root.asString)
traverseWidth(root); print("")
