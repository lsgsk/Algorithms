import Cocoa

class OrderedBinaryTree : CustomStringConvertible {
    private var root : BinaryNode?
    init() {
    }
    
    func addNode(_ newValue: Int){
        addNode(&root, newValue)
    }
    
    private func addNode(_ node : inout BinaryNode?, _ value: Int){
        if node == nil{
            node = BinaryNode(value)
        }
        else{
            if value < node!.value{
                addNode(&node!.left, value)
            }else{
                addNode(&node!.right, value)
            }
        }
    }
    func findNode(_ target: Int) -> BinaryNode?{
        return findNode(self.root, target)
    }
    
    private func findNode(_ node : BinaryNode?, _ target: Int) -> BinaryNode?{
        if let root = node{
            if target == root.value{
                return root
            }else if target < root.value{
                return findNode(root.left, target)
            }else{
                return findNode(root.right, target)
            }
        }
        else{
            return nil
        }
    }
    
    func removeNode(_ target: Int){
        removeNode(nil, self.root, target)
    }
    
    private func removeNode(_ parent : BinaryNode?, _ viewed : BinaryNode?, _ target: Int){
        if let viewed = viewed{
            if target == viewed.value{
                if let parent = parent{
                    if viewed.left == nil && viewed.right == nil{
                        removeTerminalLeaf(parent, viewed)
                    }
                    else if viewed.left == nil || viewed.right == nil{
                        removeWithOneChildLeaf(parent, viewed)
                    }
                    else{
                        removeWithTwoChildren(parent, viewed)
                    }
                    
                }else{
                    //особый случай для корня
                    if viewed.left == nil && viewed.right == nil{
                        removeLonelyRoot()
                    }
                    else if viewed.left == nil || viewed.right == nil{
                        removeRootWithOneChildLeaf()
                    }
                    else{
                        removeRootWithTwoChildren()
                    }
                }
            }else if target < viewed.value{
                return removeNode(viewed, viewed.left, target)
            }else{
                return removeNode(viewed, viewed.right, target)
            }
        }
    }
    private func removeLonelyRoot(){
        self.root = nil
    }
    private func removeRootWithOneChildLeaf(){
        root = root?.left ?? root?.right
    }
    private func removeRootWithTwoChildren(){
        if root?.left?.right == nil{
            let viewedright = root?.right
            root = root?.left
            root?.right = viewedright
        }else{
            var tparemt : BinaryNode? = root
            var tviewed : BinaryNode? = root
            while tviewed?.left?.right != nil{
                tparemt = tviewed?.left
                tviewed = tviewed?.left?.right
            }
            let viewedleft = root?.left
            let viewedright = root?.right
            tparemt?.right = tviewed?.left
            root = tviewed
            root?.left = viewedleft
            root?.right = viewedright
        }
    }
    
    
    private func removeTerminalLeaf(_ parent : BinaryNode?, _ viewed: BinaryNode?){
        if parent?.left === viewed{
            parent?.left = nil
        }else{
            parent?.right = nil
        }
    }
    private func removeWithOneChildLeaf(_ parent : BinaryNode, _ viewed: BinaryNode){
        if parent.left === viewed{
            parent.left = viewed.left ?? viewed.right
        }else{
            parent.right = viewed.left ?? viewed.right
        }
    }
    private func removeWithTwoChildren(_ parent : BinaryNode, _ viewed: BinaryNode){
        if viewed.left?.right == nil{
            let viewedright = viewed.right
            if parent.left === viewed{
                parent.left = viewed.left
            }else{
                parent.right = viewed.left
            }
            viewed.left?.right = viewedright
        }else{
            var tparemt : BinaryNode? = parent
            var tviewed : BinaryNode? = viewed
            while tviewed?.left?.right != nil{
                tparemt = tviewed?.left
                tviewed = tviewed?.left?.right
            }
            tparemt?.right = tviewed?.left
            let viewedleft = viewed.left
            let viewedright = viewed.right
            if parent.left === viewed{
                parent.left = tviewed
            }else{
                parent.right = tviewed
            }
            tviewed?.right = viewedright
            tviewed?.left = viewedleft
        }
    }
    
    
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
    
    func traverseValuesInOrder() -> String{
        return traverseValuesInOrder(self.root).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func traverseValuesInOrder(_ node: BinaryNode?) -> String{
        var values = ""
        if let node = node{
            if let left = node.left{
                values += traverseValuesInOrder(left)
            }
            values += "\(node.value) "
            if let rigth = node.right{
                values += traverseValuesInOrder(rigth)
            }
        }
        return values
    }
    
    func traverseDepthInOrder() -> String{
        return traverseDepthInOrder(self.root, 0).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    func traverseDepthInOrder(_ node: BinaryNode?, _ depth: Int) -> String{
        var values = ""
        if let node = node{
            if let left = node.left{
                values += traverseDepthInOrder(left, depth+1)
            }
            values += "\(depth) "
            if let rigth = node.right{
                values += traverseDepthInOrder(rigth, depth+1)
            }
        }
        return values
    }
}

