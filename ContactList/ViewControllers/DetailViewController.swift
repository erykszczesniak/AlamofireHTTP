
import UIKit

class DetailViewController: UIViewController {
    
    var detailContact:Contacts!
    
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var phoneLabel:UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel:UILabel!
    @IBOutlet weak var addressLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Name:" + detailContact.name
        phoneLabel.text = "Phone:" + detailContact.mobile
        genderLabel.text = "Gender:" + detailContact.gender
        emailLabel.text = "Email:" + detailContact.email
        addressLabel.text = "Address:" + detailContact.address
        

    }
    }
