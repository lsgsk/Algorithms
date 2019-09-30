import Cocoa

class AvlNode{
    let value : Int
    private var height : Int
    private var factor : Int
    var bfactor : Int{
        get{
            updateHeightAndFactor()
            return factor
        }
    }
    var left : AvlNode?
    {
        didSet{
            updateHeightAndFactor()
        }
    }
    var right : AvlNode?
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
