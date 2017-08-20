# CarryonEx

## Server APIs Need
- 用户注册createUser(username: String, appToken: String, timestamp: String, completion:{ (callback登录结果与user){} })  
~~~swift
// username==phoneNumber
DatabaseAPI.createUser(username: String, appToken: String, timestamp: String, completion: { (statusCode: String?, msg: String?, data:[String:Any]) in
    if err != nil {
        print("get error: \(err)")
        return
    }            
    // if login success, get new User from callback function
    guard let id = user?.id else { return }
    //服务器创建用户成功，设置user更多信息并将dictionary上传；
    let currUser: [String: Any] = ["id":"xxx", "username":"str", "phoneNumber":"123456", "idImageURL":"http://databaseStorageURL"]
    DatabaseAPI.updateChildValues(currUser)
})
~~~

- 用户登录login(username: String, isVerified: Bool, token: String, timestamp: String, completion: { (callback登录结果, user){} }) 
~~~swift
// username==phoneNumber
DatabaseAPI.login(username: String, appToken: String, timestamp: String, completion: { (statusCode: String?, msg: String?, data:[String:Any]) in
    if err != nil {
        print("get error when sign in: \(err)")
        return
    }
    // see user login successfully:
    if user?.username != nil {
        设置本地User来自服务器的参数：id, token, ...
    }
})
~~~

- 上传用户信息updateChildValues(id: String, appToken: String, timestamp: String, userInfoDictionary: [String : Any])
~~~swift
DatabaseAPI.updateChildValues(id: String, appToken: String, timestamp: String, userInfoDictionary: [String: Any])
~~~

- 下载用户信息getChildValues(userToken: String, appToken: String, timestamp: String, completion: { (callback下载结果){} })
~~~swift
DatabaseAPI.getChildValues(userToken: String, appToken: String, timestamp: String, completion: { (statusCode: String?, msg: String?, data:[String:Any]) in 
    if err != nil { return }
    // 读取用户成功，设置本地用户值
    currUser.id = user.id
    currUser.phone = user.phoneNumber
    currUser.passportImgURL = user.passportImgUrl
    ... ...
})
~~~

- 上传图片uploadImageWith(userToken: String, appToken: String, timestamp: String, imageData: Image, completion: { (metaData, error){}  })
~~~swift
DatabaseAPI.uploadImageWith(userToken: String, appToken: String, userInfoDictionary: [String: Any], completion: { (metaData, err) in  
    user.passportImgURL = metaData.url
})
~~~

### - to be continue ...


## Data model class
- dictionary里key的String和变量名一样，如 
~~~swift
func setupBy(dictionary: [String : Any]) {
id = dictionary["id"] as? String
username = dictionary["username"] as? String ?? ""
password = dictionary["password"] as? String

token = dictionary["token"] as? String
... ...
}
~~~

### User
~~~swift
var id: String?
var username: String?
var password: String?

var token: String? // for login server verification

var nickName: String?
var phone:    String?
var phoneCountryCode: String?
var email:    String?
var imageUrl: String?

var idCardA_Url: String?
var idCardB_Url: String?
var passportUrl: String?

var itemList : [String]? // itemId better
var tripList : [String]? // tripId

var isShipper: Bool?
~~~

### Item
~~~swift
class Item : NSObject {

var id: String?
var name: String?

var length: Int?
var width: Int?
var heigh: Int?

var weight: Int?
var value: Int?

var owner: User?
var startShippingTimeStamp: NSNumber?
var endShippingTimeStamp: NSNumber?

var tripId: String?
var itemCategory: ItemCategory?

enum ItemCategory : String {
    case bagsOrShoes = "Bags Or Shoes"
    case healthCareProducts = "Health Care Products"
    case electronics = "Electronics"
}
~~~

### Trip
~~~swift
class Trip : NSObject {

var id: String?
var travelerId: String?
var transportation: Transportation?

var startLocation: CLLocationCoordinate2D?
var endLocation: CLLocationCoordinate2D?

enum Transportation : String {
    case airplane = "Airplane"
    case car = "Car"
    case bus = "Bus"
}
~~~




## Compatibility
- iOS 9.0+
- Swift 3.0+
- Xcode 8.0+

