// Haxe中的结构体
// 结构体的扩展：在一个已定义结构体上添加新字段创建新的结构体
typedef BaseStruct = {var name:String; var age:Int;}
typedef ExtendedStruct = BaseStruct & {var address:String;}

// 扩展自带的Iterable<T>：新增了一个length字段，该字段为Int类型，且具有自读属性
// (default, null)声明了length字段的读写行为，简单理解，对于读取改字段，其行为为default，也就是公开可读；
// 对于写入改字段，其行为为null，即只能内部写，外部无法写入改字段。
typedef IterableWithLength<T> = Iterable<T> & {var length(default, null):Int;}

// 结构体中可以定义函数字段
typedef StructWithFunc = {
	var name:String;
	var func:(String, Int) -> String;
}

// 另一种定义函数字段的方法
typedef StructWithFunc2 = {
	var name:String;
	// 更像是在类中声明一个函数，只是不包括函数体部分，且必须显式指明函数的返回值类型（即使没有返回值也要写明Void）
	function func(arg:Int):Void;
}

class StructureDemo4 {
	public static function main() {
		var baseStruct:BaseStruct = {name: "John", age: 30};
		var extendedStruct:ExtendedStruct = {name: "John", age: 30, address: "123 Main St"};

		// 定义了一个数组实例
		var array:Array<Int> = [1, 2, 3, 4, 5];
		array.push(6);
		// 将数组实例赋值给一个IterableWithLength<Int>类型的变量t，可以成功
		// 原因解释：
		// 1.Iterable<T>结构中定义了一个字段iterator，而Array<Int>中也定义了相同的字段（名称和类型均一致）
		// 2.IterableWithLength<T>结构中定义了一个字段length，而Array<Int>中也定义了相同的字段（名称和类型均一致）
		// 因此Array<T>类型可以与我们自定义的IterableWithLength<T>类型兼容
		var t:IterableWithLength<Int> = array;
		trace(t.length); // 输出6

		// 因为IterableWithLength<T>扩展了Iterable<T>，所以它也具有iterator字段，因此可以使用for...in循环遍历
		for (i in t) {
			trace(i); // 输出1到6
		}

		// 创建带有函数字段的结构体实例
		var structWithFunc:StructWithFunc = {
			name: "John",
			func: function(s:String, i:Int):String {
				return s + " " + i;
			}
		};
		trace(structWithFunc.name);
		trace(structWithFunc.func("Hello", 10)); // 输出Hello 10
		// 修改函数字段，让其指向一个新函数，这里我们使用箭头函数语法来定义函数
		structWithFunc.func = (s:String, i:Int) -> s + " " + i + "!";
		trace(structWithFunc.func("Hello", 10)); // 输出Hello 10!
	}
}
