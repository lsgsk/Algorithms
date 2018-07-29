import Cocoa

class AvlTree: CustomStringConvertible {
    private var root : Node?
    
    func add(_ value : Int){
        if root != nil{
            addNode(&root!, value)
        }
        else {
            root = Node(value)
        }
    }
    
    private func addNode(_ node : inout Node, _ newValue: Int){
        if newValue < node.value{
            if node.left != nil{
                addNode(&node.left!, newValue)
            }else{
                node.left = Node(newValue)
            }
        }else{
            if node.right != nil{
                addNode(&node.right!, newValue)
            }else{
                node.right = Node(newValue)
            }
        }
        node = balance(node)
    }
    
    func rotateright(_ root : Node) -> Node{
        guard let newroot = root.left else {
            return root
        }
        root.left = newroot.right
        newroot.right = root
        return newroot
    }
    
    func rotateleft(_ root : Node) -> Node{
        guard let newroot = root.right else {
            return root
        }
        root.right = newroot.left;
        newroot.left = root;
        return newroot;
    }
    
    private func balance(_ node : Node) -> Node{
        if(node.bfactor == 2){
            if let factor = node.right?.bfactor, factor == -1 {
                 node.right = rotateright(node.right!);
            }
            return rotateleft(node);
        }
        if(node.bfactor == -2){
            if let factor = node.left?.bfactor, factor == 1{
                 node.left = rotateleft(node.left!);
            }
            return rotateright(node);
        }
        return node;
    }
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
}

class Node{
    let value : Int
    private var height : Int
    private var factor : Int
    var bfactor : Int{
        get{
            updateHeightAndFactor()
            return factor
        }
    }
    var left : Node?
    {
        didSet{
           updateHeightAndFactor()
        }
    }
    var right : Node?
    {
        didSet{
            updateHeightAndFactor()
        }
    }
    init(_ value : Int) {
        self.value = value
        self.height = 1
        self.factor = 0
    }
    private func updateHeightAndFactor(){
        let hl = left?.height ?? 0;
        let hr = right?.height ?? 0;
        self.height = (hl > hr ? hl : hr) + 1;
        self.factor = hr-hl
    }
}


