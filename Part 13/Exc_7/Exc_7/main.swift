
func findMinimalTree(startNode: Node) {
	var visitedCollection = Set<String>()
	var applicants = [Link]()
	var addedNodes = "\(startNode.name) "
	applicants.append(contentsOf: startNode.links)
	while let next = applicants.min(by: { (a, b) -> Bool in a.cost < b.cost }) {
		visitedCollection.insert(next.toNode.id)
		addedNodes += "\(next.toNode.name) "
		applicants.removeAll(where: { $0.toNode == next.toNode })
		applicants.append(contentsOf: next.toNode.links.filter { !visitedCollection.contains($0.toNode.id) } )
		print("\(addedNodes) \(applicants.map { $0.toNode.name })")
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

findMinimalTree(startNode: a)
