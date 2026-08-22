// Haxe中的结构体
class StructureDemo1 {
	public static function main():Void {
		// 创建一个匿名结构体
		var anonStruct = {
			name: "John",
			age: 30,
			city: "New York",
			isStudent: false
		};
		// 打印匿名结构体的类型定义：{ name : String, isStudent : Bool, city : String, age : Int }
		$type(anonStruct);
		// 访问结构体的字段
		trace("Name: " + anonStruct.name);
		// 修改结构体的字段
		anonStruct.age = anonStruct.age + 1;
		trace("Updated Age: " + anonStruct.age);
	}
}
