import Cocoa

class AvlTree: CustomStringConvertible {
    var root : Node?
    
    func add(_ value : Int){
        if root != nil{
            addNode(&root!, value)
        }
        else{
            root = Node(value)
        }
    }
    
    private func addNode(_ node : inout Node, _ newValue: Int){
        if newValue < node.value{
            if var left = node.left{
                addNode(&left, newValue)
            }else{
                node.left = Node(newValue)
            }
        }else{
            if var right = node.right{
                addNode(&right, newValue)
            }else{
                node.right = Node(newValue)
            }
        }
        node = balance(node)!
    }
    
    private func height(_ node: Node?) -> Int{
        return node?.height ?? 0
    }
    
    private func fixheight(_ node : Node?)
    {
        let hl = height(node?.left);
        let hr = height(node?.right);
        node?.height = (hl > hr ? hl : hr) + 1;
    }
    
    func rotateright(_ root : Node) -> Node{
        guard let newroot = root.left else {
            return root
        }
        root.left = newroot.right
        newroot.right = root
        fixheight(root)
        fixheight(newroot)
        return newroot
    }
    
    func rotateleft(_ root : Node) -> Node{
        guard let newroot = root.right else {
            return root
        }
        root.right = newroot.left;
        newroot.left = root;
        fixheight(root);
        fixheight(newroot);
        return newroot;
    }
    
    private func balance(_ node : Node) -> Node?{
        fixheight(node);
        if(bfactor(node)==2)
        {
            if(bfactor(node.right) < 0 ){
                 node.right = rotateright(node.right!);
            }
            return rotateleft(node);
        }
        if(bfactor(node) == -2)
        {
            if(bfactor(node.left) > 0){
                 node.left = rotateleft(node.left!);
            }
            return rotateright(node);
        }
        return node; // балансировка не нужна
    }
    
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
    
    private func bfactor(_ node : Node?) -> Int
    {
        return height(node?.right)-height(node?.left);
    }
}

class Node{
    var value : Int
    var height : Int
    private(set) var bfactor : Int
    var left : Node?
    {
        didSet{
           updateBFactor()
        }
    }
    var right : Node?
    {
        didSet{
            updateBFactor()
        }
    }
    init(_ value : Int) {
        self.value = value
        self.height = 1
        self.bfactor = 0
    }
    private func updateBFactor(){
        let hl = left?.height ?? 0;
        let hr = right?.height ?? 0;
        height = (hl > hr ? hl : hr) + 1;
        bfactor = hr-hl
    }
}


