

import UIKit
import Alamofire
import SwiftyJSON

class ContactsVC: UIViewController {
    

    
    var contacts = [Contacts]()
    
    @IBOutlet weak var contactsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        
        self.ContactsAPICalling {
            print("Contacts Downloaded")
            self.contactsTableView.reloadData()
        }
        
    }
    func ContactsAPICalling(completed: @escaping DownloadComplete){
            
            Alamofire.request(API_URL, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { (contactsResponse) in
                
                let result = contactsResponse.result
                let contactsJSON = JSON(result.value!)
                
                print(contactsJSON)
                
                for i in 0..<contactsJSON.count {
                    
                    let allContacts = Contacts(contactDict: contactsJSON[i])
                    
                    self.contacts.append(allContacts)
                }
                
                completed()
           
            }
            
        }
        
    }

extension ContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = contactsTableView.dequeueReusableCell(withIdentifier: "contactscell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "contactscell")
        }
        
        
        cell?.textLabel?.text = contacts[indexPath.row].name
        cell?.detailTextLabel?.text = contacts[indexPath.row].email
        
        return cell!
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.detailContact = contacts[(contactsTableView.indexPathForSelectedRow?.row)!]
            contactsTableView.deselectRow(at: contactsTableView.indexPathForSelectedRow!, animated:true)
        }
    }
    


}

