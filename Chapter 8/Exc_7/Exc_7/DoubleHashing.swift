class DoubleHashing: CustomStringConvertible {
    private var array : [HashPair?]
    init(count: Int = 60) {
        self.array = Array(repeating: nil, count: count)
    }
    
    func doubleHashFunction(_ start: Int) -> Int        {
        return start % 2 == 0 ? 1 : 5 // по определению, должно работать =)
    }
    
    func makeItems(){
        let values = [97, 79, 25, 69, 93, 52,  1, 71,  6, 28,
                      45, 76, 49, 57, 36, 12,  9, 55, 60, 34,
                      65, 68, 40, 90, 83,  7, 53, 35, 26, 54,
                      2, 13, 84,  0,  5, 91, 37, 77, 63, 64,
                      51, 43, 96, 44, 15, 32, 42, 39, 24,  8]
        for value in values{
            insert(value, "'\(String(value))'")
        }
    }
    
    func insert(_ key : Int, _ value: String){
        if count == array.count{
            print("Hashtable is full")
        } else if find(key) != nil{
            print("Element with the same key '\(key)' is already exist")
        }
        else{
            var step = 1
            var index = key % array.count
            let newPair = HashPair(key, value)
            while let _ = array[index]{
                index = (index + (doubleHashFunction(step))) % array.count
                step += 1
            }
            //if step > 1{ print("\(key) -> \(step)") }
            array[index] = newPair
            count += 1
        }
    }
    
    private(set) var count : Int = 0
    
    func find(_ key : Int) -> String?{
        var iteration = 0
        var step = 1
        var index = key % array.count
        while let item = array[index], item.key != key, iteration != array.count - 1 {
            index = (index + (doubleHashFunction(step))) % array.count
            iteration += 1
            step += 1
        }
        return array[index]?.value
    }
    
    var description: String{
        var str = "Hashtable: \n"
        for i in 0..<array.count{
            if let item = array[i]{
                str += "\(String(repeating: " ", count: (5-item.value.count-1)))\(item.value) "
            } else{
                str += " nil "
            }
            if  i % 10 == 9{
                str += "\n"
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


