import haxe.ValueException;

// Haxe抽象类型

abstract ImprovedString(String) from String to String {
	inline public function new(str:String) {
		this = str;
	}

	// 定义隐式类型转换

	@:from
	public static function fromInt(i:Int):ImprovedString {
		return new ImprovedString(Std.string(i));
	}

	@:from
	public static function fromFloat(f:Float):ImprovedString {
		return new ImprovedString(Std.string(f));
	}

	@:from
	public static function fromArray(arr:Array<Any>):ImprovedString {
		return new ImprovedString(arr.join(""));
	}

	@:to
	public function toInt():Int {
		return Std.parseInt(this);
	}

	@:to
	public function toFloat():Float {
		return Std.parseFloat(this);
	}

	@:to
	public function toArray():Array<String> {
		return this.split("");
	}

	// 运算符重载

	@:op(A * B)
	public function repeat(n:Int):ImprovedString {
		// 参数检查
		if (n < 0) {
			throw new ValueException("Negative repeat count not allowed.");
		}
		// 如果 n 为 0，返回原对象
		if (n == 0) {
			return abstract;
		}

		// 构造新的对象
		var buffer = new StringBuf();
		for (i in 0...n) {
			buffer.add(abstract);
		}
		return buffer.toString();
	}
}

class AbstractTypeDemo2 {
	public static function main() {
		var iStr1:ImprovedString = new ImprovedString("Hello, World!");
		var iStr2:ImprovedString = "A quick brown fox jumps over the lazy dog.";
		var str:String = iStr2;
		trace(str); // 输出: A quick brown fox jumps over the lazy dog.
		trace(iStr1); // 输出: Hello, World!
		trace(iStr2); // 输出: A quick brown fox jumps over the lazy dog.

		var iStr3:ImprovedString = 123; // 调用 fromInt 方法
		trace(iStr3); // 输出: 123
		var iStr4:ImprovedString = 123.456; // 调用 fromFloat 方法
		trace(iStr4); // 输出: 123.456
		var iStr5:ImprovedString = [1, 2, 3, 4, 5]; // 调用 fromArray 方法
		trace(iStr5); // 输出: 12345

		var intVal:Int = iStr3; // 调用 toInt 方法
		trace(intVal); // 输出: 123
		var floatVal:Float = iStr4; // 调用 toFloat 方法
		trace(floatVal); // 输出: 123.456
		var arrayVal:Array<String> = iStr5; // 调用 toArray 方法
		trace(arrayVal); // 输出: [1, 2, 3, 4, 5]

		var repeatedStr:ImprovedString = iStr1 * 3; // 调用 repeat 方法
		trace(repeatedStr); // 输出: Hello, World!Hello, World!Hello, World!
	}
}
