

import Foundation
import Alamofire
import SwiftyJSON


class Contacts: NSObject, Codable {

  private var _id:String!
     private var _name: String!
     private var _email: String!
     private var _address: String!
     private var _gender:String!
     private var _phone:String!
     
     
     var id:String {
         if _id == nil {
             _id = ""
         }
         
         return _id
     }
     
     var name:String! {
         if _name == nil {
             _name = ""
         }
         
         return _name
     }
     
     var email:String {
         if _email == nil {
             _email = ""
         }
         
         return _email
     }
     var address:String {
         if _address == nil {
             _address = ""
         }
         
         return _address
     }
     
     var gender:String {
         if _gender == nil {
             _gender = ""
         }
         
         return _gender
     }
     
     var mobile:String{
         if _phone == nil{
             _phone = ""
         }
         
         return _phone
     }
     
     init(contactDict: JSON) {
         self._id = contactDict["id"].stringValue
         self._name = contactDict["name"].stringValue
         self._address = contactDict["address"].stringValue
         self._email = contactDict["email"].stringValue
         self._phone = contactDict["phone"].stringValue
         self._gender = contactDict["gender"].string
     }
     
 }
