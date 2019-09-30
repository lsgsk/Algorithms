
func findMinimalTree(startNode: Node) -> String {
	var ostov = [(Node,Link)]()
	var applicants = [(Node,Link)]()
	applicants.append(contentsOf: startNode.links.map { (startNode, $0) })
	while let next = applicants.min(by: { (a, b) -> Bool in a.1.cost < b.1.cost }) {
		ostov.append(next)
		applicants.removeAll(where: { $0.1.toNode == next.1.toNode })
		applicants.append(contentsOf:next.1.toNode.links.filter { !ostov.map { $0.1.toNode}.contains( $0.toNode) }.map { (next.1.toNode, $0) })
	}
	return ostov.reduce("Ostov:\n", { (r, l) -> String in "\(r)\(l.0.name)-\(l.1.cost)-\(l.1.toNode.name) \n" })
}

let a = Node(name: "A")
let b = Node(name: "B")
let c = Node(name: "C")
let d = Node(name: "D")
let e = Node(name: "E")
let f = Node(name: "F")
let g = Node(name: "G")
let h = Node(name: "H")
let i = Node(name: "I")

a.links.append(Link(cost: 9, toNode: b))
a.links.append(Link(cost: 10, toNode: d))
a.links.append(Link(cost: 15, toNode: e))
b.links.append(Link(cost: 10, toNode: c))
c.links.append(Link(cost: 11, toNode: f))
d.links.append(Link(cost: 10, toNode: e))
d.links.append(Link(cost: 12, toNode: g))
e.links.append(Link(cost: 11, toNode: f))
g.links.append(Link(cost: 12, toNode: h))
h.links.append(Link(cost: 13, toNode: f))
i.links.append(Link(cost: 3, toNode: d))

print(findMinimalTree(startNode: a))
