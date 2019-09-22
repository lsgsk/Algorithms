import Cocoa

class Stack<T> : CustomStringConvertible {
	private var curret: StackCell<T>?
	func push(item: T){
		let cell = StackCell(value: item)
		if curret == nil{
			curret = cell
		}
		else{
			cell.prev = curret
			curret = cell
		}
	}
	func pop() -> T?{
		if curret != nil{
			let value = curret?.value
			curret = curret?.prev
			return value
		}else{
			return nil
		}
	}
	
	func dump() -> [T]{
		var array = [T]()
		var cell = curret
		while let item = cell {
			array.append(item.value)
			cell = cell?.prev
		}
		return array
	}
	
	public var description: String
	{
		var str = "Stack: "
		var cell = curret
		while let item = cell {
			str  += "\(String(describing: item.value)) "
			cell = cell?.prev
		}
		return str
	}
	
	var count : Int{
		get{
			var length = 0;
			var cell = curret
			while let _ = cell {
				length += 1
				cell = cell?.prev
			}
			return length
		}
	}
}

fileprivate class StackCell<T>{
	init(value:T) {
		self.value = value
	}
	let value : T
	var prev : StackCell<T>?
}

