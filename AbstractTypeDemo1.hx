// Haxe抽象类型
// 是一种编译期特性，在具体类型"之上"定义类型，以修改或增强它们的行为，一种在运行时实际上是另一种类型的类型

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

		// 因为ImprovedInt定义了from Int to Int，所以可以和Int类型进行互相转换
		var improvedInt2:ImprovedInt = 2; // 这是From Int
		var normalInt:Int = improvedInt2; // 这是To Int
		trace(normalInt); // 输出: 2

		improvedInt2.calc(5);
		trace(improvedInt2); // 输出: 32
	}
}
