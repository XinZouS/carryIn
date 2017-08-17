# carryonex

## Data model class

### User
~~~swift
var id: String?
var username: String?
var password: String?

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

