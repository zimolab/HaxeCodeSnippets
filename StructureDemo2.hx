// Haxe中的结构体
// 使用typedef为结构体类型定义别名
typedef StudentStruct = {
	name:String,
	age:Int,
	gender:String,
	score:Float,
	address:String,
	phone:String,
	email:String,
}

// 结构体的类表示法
typedef StudentStruct2 = {
	var name:String;
	var age:Int;
	var gender:String;
	var score:Float;
	var address:String;
	var phone:String;
}

class StructureDemo2 {
	public static function main() {
		// 创建一个StudentStruct类型的结构体实例
		var student1:StudentStruct = {
			name: "Alice",
			age: 20,
			gender: "Female",
			score: 85.5,
			address: "123 Main St",
			phone: "123-456-7890",
			email: "alice@example.com"
		}
		// 结构体类型：StudentStruct
		$type(student1);
		// 输出结构体实例的属性
		trace(student1.name);
		trace(student1.age);
		trace(student1.gender);
		trace(student1.score);
		trace(student1.address);
		trace(student1.phone);

		// 尽管StudentStruct和StudentStruct2是两个不同的类型名称
		// 但是由于它们的字段定义是完全一致的，这两种类型是相容的，实例可以互相赋值
		var student2:StudentStruct2 = student1;
		// 结构体类型：StudentStruct2
		$type(student2);

		// 结构体的JSON表示法
		var jsonStruct = {
			"name": "Bob",
			"age": 22,
			"gender": "Male",
			"score": 90.0,
			"address": "456 Elm St",
			"phone": "987-654-3210",
			"email": "bob@example.com"
		}
		// 打印类型： { score : Float, phone : String, name : String, gender : String, email : String, age : Int, address : String }
		$type(jsonStruct);
		// 由于字段定义完全一致，因此仍然可以互相赋值
		var student3:StudentStruct = jsonStruct;
		// 结构体类型：StudentStruct
		$type(student3);
		// 输出结构体实例的属性
		trace(jsonStruct.name);
		trace(jsonStruct.age);
		trace(jsonStruct.gender);
		trace(jsonStruct.score);
		// 或者使用Reflect工具类，当使用非法标识符作为字段名，无法像上面那样使用点语法直接访问字段值
		trace(Reflect.field(jsonStruct, "score")); // 输出 90.0
		Reflect.setField(jsonStruct, "name", "Charlie"); // 修改字段值
		trace(jsonStruct.name); // 输出 Charlie
	}
}
