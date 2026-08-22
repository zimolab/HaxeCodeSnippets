// Haxe中的结构体
// 结构体中可以定义可空字段
typedef User = {
	name:String,
	age:Int,
	?email:String
}

// 如果使用类表示法，可以使用@:optional元数据标签声明可选字段
typedef User2 = {
	var name:String;
	var age:Int;
	@:optional var email:String;
}

// 自4.0版本开始，类表示法也支持使用?来表示可选字段
typedef User3 = {
	var name:String;
	var age:Int;
	var ?email:String;
}

class StructureDemo3 {
	public static function main() {
		// 对于可选字段，如果没有赋值，则默认为null
		var user1:User = {name: "Alice", age: 25};
		trace(user1.email); // 输出: null
		user1.email = "alice@example.com";
		trace(user1.email); // 输出: alice@example.com

		var user2:User2 = {name: "Bob", age: 30};
		trace(user2.email); // 输出: null
		user2.email = "bob@example.com";
		trace(user2.email); // 输出: bob@example.com

		var user3:User3 = {name: "Charlie", age: 35};
		trace(user3.email); // 输出: null
		user3.email = "charlie@example.com";
		trace(user3.email); // 输出: charlie@example.com
	}
}
