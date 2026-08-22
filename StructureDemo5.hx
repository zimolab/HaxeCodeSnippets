// Haxe中的结构体（Struct）
// 结构体字段可以被声明为final，这表示该字段的值被指定后就不能再被修改。

typedef User = {
	var name:String;
	var age:Int;
	var email:String;
	final uid:Int;
}

class StructureDemo5 {
	public static function main() {
		// 创建一个User结构体实例
		var user:User = {
			name: "Alice",
			age: 30,
			email: "alice@example.com",
			uid: 12345
		};
		// 非final字段可以被修改
		user.name = "Bob";
		user.age = 31;
		user.email = "bob@example.com";
		// final字段不能被修改
		// user.uid = 67890; // 这行代码会引发编译错误：This expression cannot be accessed for writing
		trace(user); // 输出：{name: Bob, age: 31, uid: 12345, email: bob@example.com}
	}
}
