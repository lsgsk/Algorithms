import Cocoa

class LinearProbing: CustomStringConvertible {
    private var array : [HashPair?]
    init(count: Int = 10) {
        self.array = Array(repeating: nil, count: count)
    }
    
    func makeItems(){
        let values = [40, 1, 5, 20, 6, 11, 50, 12, 21]
        for value in values{
            insert(value, "'\(String(value))'")
            //print(self)
        }
    }
    
    func insert(_ key : Int, _ value: String){
        if count == array.count{
            print("Hashtable is full")
        } else if find(key) != nil{
            print("Element with the same key is already exist")
        }
        else{
            var index = key % array.count
            let newPair = HashPair(key, value)
            while let _ = array[index]{
                index = (index + 1) % array.count
            }
            array[index] = newPair
            count += 1
        }
    }
    
    private(set) var count : Int = 0
    
    func find(_ key : Int) -> String?{
        var iteration = 0
        var index = key % array.count
        while let item = array[index], item.key != key, iteration != array.count - 1 {
            index = (index + 1) % array.count
            iteration += 1
        }
        return array[index]?.value
    }
    
    var description: String{
        var str = "Hashtable: \n"
        for i in 0..<array.count{
            if let item = array[i]{
                str += "\(item.value) "
            } else{
                str += "nil "
            }
        }
        return str
    }
}

fileprivate class HashPair{
    let key : Int
    let value : String
    init(_ key : Int, _ value: String) {
        self.key = key
        self.value = value
    }
}


