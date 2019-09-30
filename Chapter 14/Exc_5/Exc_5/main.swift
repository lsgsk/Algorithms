import Foundation

func colorize(_ node: Node, _ color: Color) {
	node.color = color
	var otherColor =  Color.red
	if case Color.red = color {
		otherColor = .blue
	}
	for cell in node.links.map({ $0.toNode }) {
		if cell.color == .none {
			colorize(cell, otherColor)
		}
		else {
			if cell.color != otherColor {
				fatalError("Граф не может быть закрашен")
			}
		}
	}
}

let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")

a.links.append(Link(cost: 9, toNode: b))
a.links.append(Link(cost: 10, toNode: d))
//a.links.append(Link(cost: 15, toNode: e))
b.links.append(Link(cost: 10, toNode: c))
//c.links.append(Link(cost: 11, toNode: f))
d.links.append(Link(cost: 10, toNode: e))
d.links.append(Link(cost: 12, toNode: g))
e.links.append(Link(cost: 11, toNode: f))
g.links.append(Link(cost: 12, toNode: h))
//h.links.append(Link(cost: 13, toNode: f))
colorize(a, .red)
print([a,b,c,d,e,f,g,h].map { "\($0.name) \($0.color)" } )
