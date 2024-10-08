import UIKit

var arr = [1,3,5,7,9]

arr[0] = 999
arr.append(11)
arr.count
arr.insert(1, at: 0)
arr.remove(at: 1)
arr.swapAt(0, arr.count-1)

for i in arr {
    print(i,terminator: " ")
}



var dictionaries = [
    "A":1,
    "B":2,
    "C":3,
]
//字典查詢
dictionaries["A"]

//新增字典
dictionaries["D"] = 4

//更改字典的內容
dictionaries["B"] = 6

//更新或插入字典
dictionaries.updateValue(555, forKey: "F")

//移除指定的字典
dictionaries.removeValue(forKey: "A")

dictionaries = [:]
print(dictionaries.count)

for i in dictionaries {
    print(i)
}

// switch
var com = "*"
switch com {
        case "+":
            print("加")
        case "-":
            print("減")
        case "*":
            print("乘")
        case "/":
            print("除")
        default:
            print("請選擇 + - * /")
}

//reversed() 反轉
let numArr = [75, 43, 103, 87, 12]
for i in (0...numArr.count-1).reversed() {
    print(i)
}

//每次迴圈+2  stride()
let numArr2 = [75, 43, 103, 87, 12]
for i in stride(from: 0, to: numArr2.count, by: 2) {
    print(i)
}

var optionalString: String? = "Hello"
//！驚嘆號等於強制解包
//print(optionalString!) //如果包裝為空時(nil)解包會出現錯誤
optionalString = nil
if optionalString != nil {
    print(optionalString!)
} else {
    print("optionalString為空")
}

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
//if let 安全解包 如果有值才被解包
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

var optionalName2: String? = "John Appleseed"
optionalName2 = "Andy"
var greeting2 = "Hello!"
if let name = optionalName {
    greeting2 = "Hello, \(name)"
    print(greeting)
} else {
    print("進入else")
}

//新語法 如果??左為nil 將使用右方的值
let nickname: String? = "Alex"
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting)
//舊語法 a != nil ? a! : b
let nickname2: String? = "Alex"
let fullName2: String = "John Appleseed"
let informalGreeting2 = "Hi \(nickname2 != nil ? nickname2! :  fullName2)"
print(informalGreeting2)



//switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
//比較多個值
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
//x為常數 hasSuffix為判斷是否為指定結尾
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}


//字典內放陣列
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
// 底線(_)表示忽略Key 只帶入值
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//練習6 將_替換為常數名稱，並追蹤哪一種類的數字是最大的
largest = 0
var numMax:String = ""
for (num, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            numMax = num
        }
    }
}
print("最大數字:\(largest)出現在\(numMax)數列")


//while 迴圈
var n = 2
while n < 100 {
    n *= 2
}
print(n)

//repeat while 迴圈
var m = 2
repeat {
    m *= 2
} while m < 100
print(m)



//練習7 觀察兩種迴圈的結果
var o = 2
repeat {
    o *= 2
} while o < 0
print(o)

o = 2
while o < 0 {
    o *= 2
}
print(o)


//使用 ..< 建立一個索引陣列來執行迴圈
var total = 0
for i in 0..<4 {
    total += i
    print(total)
}


//函式 func , -> 表示回傳類型
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

//_ 表示可以省略變數
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")


//練習8 刪除day參數，增加一個參數在問候語中包含今天的特價午餐
//變數前方可以自訂引數標籤(todayLunch)
func lunch(_ person: String, todayLunch food: String) -> String {
    return "Hello \(person), today special food is \(food)."
}
print(lunch("Alex",todayLunch: "bread"))


func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0


    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }


    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//(min: Int, max: Int, sum: Int) .sum表示變數
print(statistics.sum)
//(min: Int, max: Int, sum: Int)  .2表示索引的位置
print(statistics.2)




//閉包練習
let closureTest1 = { 
    num1 in num1 * 2
}
//使用閉包 並傳入參數5
let result1 = closureTest1(5)
print(result1)





//巢狀函式 巢狀函數可以存取在外部函數中聲明的變數
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//函數是一流的類型。這意味著一個函數可以返回另一個函數作為其值
//函式的型別：參數列表的型別+回傳值的型別 可省略為(Int) -> Int
func makeIncrementer() -> ((Int) -> Int) {  //此函式回傳一個函式，其回傳函式的型別為 帶一個INT參數，回傳值為INT的函式
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
//呼叫外部函式，取得一個尚未執行的匿名函式，記錄此函式的變數或常數即為函式名稱
var increment = makeIncrementer()
//以常數名稱或變數名稱來執行函式
increment(7)

//
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
//第一種方法
hasAnyMatches(list: numbers, condition: lessThanTen)
/*
 閉包 至一段稍後可以呼叫的程式碼區塊，實際上是一種函式的特殊情況
 閉包 是沒有函式名稱的函式
*/

//第二種方法，呼叫外部函式：以匿名 閉包 傳入引入，以{}自行撰寫閉包的格式
hasAnyMatches(list: [20,19,7,12], condition: {
    //參數 回傳型別
    (number:Int) -> Bool
    in
    //實作
    return number < 10
})

//第三種方法 呼叫外部函式：以 尾隨閉包(trailing closure) 傳入引數（使用輔助編碼）
hasAnyMatches(list: [20,19,7,12]) {
    number in number < 10
}

//第四種方法 呼叫外部函式：以省略參數命名的閉包傳入引數（不建議）
hasAnyMatches(list: [20,19,7,12]) {
    return $0 < 10
}

//陣列的對應處理方法
//以方法三尾隨閉包傳入引數
let newArr =
    numbers.map {
        number in
        return 3 * number
    }

//以方法二
//傳入陣列的自訂處理邏輯
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//猜測陣列的map之運作邏輯
func myMappingArray(numbers:[Int],map:(Int) -> String) -> [String] {
    //宣告處理過後將回傳的空陣列
    var newArray = [String]()
    //列出數字陣列
    for item in numbers {
        //以陣列元素來執行呼叫者傳入的函式(呼叫者自定的對應處理方法)，將每一個陣列元素依照傳入的處理邏輯運作
        newArray.append(map(item))
    }
    return newArray
}

//呼叫猜測的myMappingArray函式
let mappingResult =
    myMappingArray(numbers: numbers) {
        num in num
        return "數字num\(num * 3)"
    }

//練習9 重寫閉包以對所有奇數傳回零
// numbers = [20, 19, 7, 12]
let newArr2 =
    numbers.map {
        number in
        if number % 2 == 0 {
            return number
        } else {
            return 0
        }
    }
newArr2


//陣列的排序方法
//原numbers陣列[20,19,7,12]
//方法一 由小到大排序陣列
let sortedArray = numbers.sorted()
//方法二 由大到小排序陣列
let sortedArray2 = sortedArray.reversed()
for item in sortedArray2 {
    print("排序：\(item)")
}

//方法三 "<"由小到大排序，">"由大到小排序(省略閉包的參數命名)
let sortedNumbers = numbers.sorted {$0 < $1}
print(sortedNumbers)

//方法四 以自定義方法由大到小排序陣列
let sortedArray3 = numbers.sorted {
    num1,num2 in
    //回傳num1是否比num2大
    return num1 > num2
}
sortedArray3

//物件和類別(Objects and Classes)
//類別和實體(Class and Instance)
/*
 使用class後跟類別名稱來建立類別
 類別中的屬性(property)宣告的編寫方式與常數或變數宣告相同
 方法和函式的宣告方式相同
 注意：
    類別的實體(instance)傳統上稱為物件(object)
    Swift成使語言在
    結構(structure)和類別(class)的功能比其他程式語言更接近，大部分使用的實體(instance)來描述型別的記憶
*/
//使用class後跟類別名稱來建立類別
class Shape {
    //當類別中所有屬性都有初始值時，類別會自動得到一個不帶參數的初始化方法
    var numberOfSides = 0  //形狀有幾邊（可讀可寫的屬性）
    let dimention = "3D"  //形狀的維度（唯獨屬性 read-only/get-only）
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    //練習10 使用let新增一個常數屬性，並新增另一個帶有參數的方法
    func shapWithHeight(height:Int) -> String {
        return "這是\(dimention)形狀，高度\(height)公分"
    }
}


//透過在類別名稱後面加上括號來建立類別的實體(instance)。使用點語法存取實體的屬性和方法。
var shape = Shape() //使用自動得到的不帶參數的初始化方法配置實體 //allocate(分派)記憶體空間，形成實體(instance) 即執行initializer(建構子/初始化方法)
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
shape.shapWithHeight(height: 30)

class NamedShape {
    //當有任一屬性沒有初始值時，類別就沒有自動賦予的初始化方法，初始化方法必須自定，且一定要為缺少初始值的屬性補值
    var numberOfSides: Int = 0  //形狀的邊數屬性
    var name: String  //形狀名稱屬性

    //init定義初始化方法，實作中必須為缺少初始值的屬性補值
    init(name: String) {
        //當屬性名稱與參數名稱時，屬性前方必須加上self(類似this)關鍵字配合點語法呼叫對應的屬性
        self.name = name
    }
    //自定一個不太參數的初始化方法
    init() {
        name = "未知形狀"
    }
    
    init(numberOfSides: Int,name: String) {
        self.numberOfSides = numberOfSides
        self.name = name
    }
    
    //反初始化方法(deinitializer)不帶參數，不需要參數列表的小括號，此方法會在實體釋放前自動被呼叫，不能自行呼叫
    deinit {
        //提供實體釋放前清理所使用外部資源的程式，例如：關閉已開啟的外部檔案
        //因為這此時實體還未真正釋放，可以在此存取屬性和方法
        print("\(name)被釋放")
    }
    
    func simpleDescription() -> String {
       return "A shape:\(name) with \(numberOfSides) sides."
    }
}

//使用命名形狀類別
var aShape:NamedShape? = NamedShape(name: "特殊形狀")
aShape?.numberOfSides
aShape?.numberOfSides = 10
aShape?.simpleDescription()

//重新配置時，會先釋放原來的實體(原來的未知形狀)
aShape = NamedShape(numberOfSides: 5, name: "五邊形")
aShape?.simpleDescription()

//主動清空包裝盒(清空選擇值)時，會釋放本身(五邊形被釋放)
aShape = nil

//bShape的型別為預先拆封的選擇值(implicitly upwrap)
var bShape:NamedShape! = NamedShape(name:"新形狀")
bShape.name
bShape.simpleDescription()

bShape = nil

//選擇性串連呼叫(Optional Chaining)
//無須拆封即可村子取選擇值的成員，串連呼叫的過程，在選擇值之處，必須出現問號
//宣告人類別
class Person {
    //居住屬性
    var residence: Residence?
}

//宣告居所類別
class Residence {
    //房間屬性
    var numberOfRooms = 1
}

//實體化john
let john = Person()
john.residence = Residence()
//以下此行會觸發執行階段錯誤，因為強制拆封了nil(residence)
//let roomCount = john.residence!.numberOfRooms

//選擇性串連的過程，只要有任一環節出現問號，最後串道的屬性或方法的回傳值，都會是選擇值，而且不管串連過程發生過幾次問號，最後的型別只會帶一個問號
//if let(選擇性綁定)
//選擇性串連，可以配合if let選擇性綁定語法自動拆封
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//繼承()
/*
 子類別(subclass)是在類別名稱之後包含父類名稱，並用冒號分隔
 類別不需要繼承自任何標準的跟類別(root class)，因此可以根據需要包含或省略父類別
 子類別可以複寫父類別方法中的實作，並以關鍵字override做標記
*/
class Square:NamedShape {  //繼承自NameShape父類別
    var sideLength:Double  //單邊長度屬性
    /*
        指定為初始化方法有兩種：
        1.指定初始化方法：會為所有屬性準備初始值，指定初始化方法必須總是向上代理(總是向上呼叫到父類別的指定初始化方法)
        2.便利初始化方法：必須橫向代理(delegate cross)(便利初始化方法只能呼叫自己類別中的便利初始化方法or指定初始化方法)
        Swift對初始化方法之間的代理呼叫應遵守以下三個規則：
        規則一
        指定初始化方法必須直接呼叫父類別的指定初始化方法(不能父類別的便利初始化方法)
        
        規則二
        便利初始化方法必須呼叫同一類別中的另一個初始化方法
     
        規則三
        便利初始化方法最終必須呼叫指定的初始化方法
    */
    //宣告指定初始化方法：此方法會為所有屬性補上初始值，包含呼叫父類別的初始化方法
    init(sideLength:Double,name:String) {
        //Step1.先針對自己的屬性給予初始值
        self.sideLength = sideLength
        //Step2.呼叫父類別的初始化方法，為父類別繼承過來的屬性補上初始值
        super.init(name: name)  //至此呼叫只能呼叫父類別的指定初始化方(不能呼叫便利初始化方法)
        //Step3.當所有屬性都有初始值之後，記憶體即配置完成，才能進一步更改屬性的初始值(此步驟可省略)
        numberOfSides = 4
    }
    
    //便利初始化(convenience)
    convenience override init() {
        //橫向代理呼叫到自己的便利初始化方法
        self.init(sideLength: 5, name: "預設正方形")
    }
    
    
    //計算正方形面積的方法
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
var showArea = Square()
showArea.simpleDescription()

/*
 練習11 建立一個NameShape的子類別，名為Circle類別，該子類別以半徑(radius)和名稱(name)作為其初始化方法的參數
 在Circle類別上實作area()方法計算圓面積，和複寫simpleDescriptionDescriprion()方法，回傳與而行的資訊
 計算圓面積公式：π * 半徑平方
*/
class Circle:NamedShape {
    var radius:Double
    
    init(radius:Double,name:String) {
        self.radius = radius
        super.init(name:name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "面積：\(String(format:"%.2f",area())),半徑：\(radius),面積：\(name)"
    }
}
var showCircle = Circle(radius: 6, name: "小圓")
showCircle.simpleDescription()

//儲存屬性&計算屬性(Stored Property & Computed Property)
class EquilateralTriangle:NamedShape {
    var sideLength:Double = 0.0
    
    init(sideLength:Double,name:String) {
        super.init(name: name)
        numberOfSides = 3
        self.sideLength = sideLength
    }
    //總長度(計算屬性)
    var perimeter:Double {  //計算屬性只能宣告為var，不能宣告為let，而且必須明確宣告型別
        //取值段
        get {
            return 3.0 * sideLength
        }
        //設值段 (預設以newValue常數接取設定值)
        set {
            //以總長度回算單邊長度
            sideLength = newValue / 3.0
            //計算屬性不能存值，存值只能存在儲存屬性
        }
    }
    
    /*
     練習11
     計算三角形面積使用海龍公式：a,b,c是三角形的三邊長度，s=(a+b+c)/2，計算s*(s-a)*(s-b)*(s-c)，將此值開根號sqrt()
    */
    //以唯獨計算屬性回傳三角形面積
    var triangleArea:Double {
        get {
            let s = self.perimeter / 2
            return sqrt(s*(s-self.sideLength)*(s-self.sideLength)*(s-self.sideLength))
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
//實體化EquilateralTriangle類別
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)  //運作取值段(get)
triangle.perimeter = 9.9  //運作設值段(set)
print(triangle.sideLength)
