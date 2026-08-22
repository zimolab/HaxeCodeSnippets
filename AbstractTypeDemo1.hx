// Haxe抽象类型
// 是一种编译期特性，在具体类型"之上"定义类型，以修改或增强它们的行为，一种在运行时实际上是另一种类型的类型
// 使用from Int to Int来定义隐式转换，这种转换是一种直接转换，只允许与底层数据类型兼容的类型
abstract ImprovedInt(Int) from Int to Int {
	inline public function new(value:Int) {
		// this指向底层数据，它的类型是底层数据的类型，此例中就是Int类型
		// 任何内联成员函数中都可以改变this以改变底层数据的值
		this = value;
	}

	inline public function power(exponent:Int) {
		// this指向底层数据
		// 任何内联成员函数中都可以改变this以改变底层数据的值
		this = Std.int(Math.pow(this, exponent));
	}

	inline public function calc(other:Int) {
		// 与this不同，这里abstract指向抽象类型对象本身而非其底层数据
		abstract.power(other);
	}

	// 通过定义@:from和@:to支持非相容类型隐式转换

	@:from
	static public function fromString(str:String):ImprovedInt {
		// 从String转到ImprovedInt，定义之后，可以使用类似的语法
		// var improvedInt:ImprovedInt = "10";
		return new ImprovedInt(Std.parseInt(str));
	}

	@:from
	static public function fromFloat(float:Float):ImprovedInt {
		// 从Float转到ImprovedInt，定义之后，可以使用类似的语法
		// var improvedInt:ImprovedInt = 10.5;
		return new ImprovedInt(Std.int(float));
	}

	@:to
	public function toString():String {
		// 从ImprovedInt转到String，定义之后，可以使用类似的语法
		// var str: String = improvedInt;
		return Std.string(this);
	}

	@:to
	public function toArray():Array<Int> {
		// 从ImprovedInt转到Array<Int>，定义之后，可以使用类似的语法
		// var array: Array<Int> = improvedInt;
		return [this];
	}
}

class AbstractTypeDemo1 {
	public static function main() {
		var improvedInt:ImprovedInt = new ImprovedInt(10);
		trace(improvedInt); // 输出: 10
		// 编译到目标语言，比如JavaScript，ImprovedInt会被替换为底层Int类型:
		// var improvedInt = 12;
		// console.log(improvedInt);
		// 这证明了抽象类型是一种编译期特性

		improvedInt.power(2);
		trace(improvedInt); // 输出: 100
		// 查看编译到js的代码，power函数消失了，所有内联成员函数都会被替换直接对于底层数据的操作
		// improvedInt = Math.pow(improvedInt,2) | 0;
		// console.log(improvedInt);

		// 因为ImprovedInt定义了from Int to Int，所以可以和Int类型进行互相隐式转换
		var improvedInt2:ImprovedInt = 2; // 这是From Int
		var normalInt:Int = improvedInt2; // 这是To Int
		trace(normalInt); // 输出: 2

		improvedInt2.calc(5);
		trace(improvedInt2); // 输出: 32

		var improvedInt3:ImprovedInt = "10"; // 这里发生了一个隐式转换，编译后的代码会调用ImprovedInt.fromString方法
		trace(improvedInt3); // 输出: 10

		var improvedInt4:ImprovedInt = 10.5; // 这里发生了一个隐式转换，编译后的代码会调用ImprovedInt.fromFloat方法
		trace(improvedInt4); // 输出: 10

		var str:String = improvedInt4; // 这里发生了一个隐式转换，编译后的代码会调用ImprovedInt.toString方法
		trace(str); // 输出: 10

		var arr:Array<Int> = improvedInt4; // 这里发生了一个隐式转换，编译后的代码会调用ImprovedInt.toArray方法
		trace(arr); // 输出: [10]
	}
}
