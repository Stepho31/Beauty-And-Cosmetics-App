//
//  ProdcutsView.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/28/23.
//

import UIKit

class ProdcutsView: UIViewController {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var shopButton: UIButton!
    
    var productNameText: String?
    var productImageURL: URL?
    var productDescriptionText: String?
    var productURL: URL?
    
    //MARK: Add the viewModel property
    var viewModel: ProductsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productName.text = productNameText
        productDescription.text = productDescriptionText
        productImageInfo()
        shopButtonInfo()
        view.backgroundColor = .tertiarySystemGroupedBackground
        
    }
    
    func productImageInfo() {
        
        productImage.downloaded(from: productImageURL!)
        
        productImage.contentMode = .scaleAspectFill
        
        productImage.layer.cornerRadius = productImage.frame.size.width / 2
        productImage.layer.cornerRadius = 15
        productImage.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        productImage.layer.shadowOpacity = 3.9 // set the shadow opacity
        productImage.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        productImage.layer.shadowRadius = 3 // set the shadow radius
        
    }
    @IBAction func shopButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let webVC = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        DispatchQueue.main.async {
            if self.productURL != nil {
                webVC.websiteLink = self.productURL
            } else {
                print("Error")
            }
        }
        
        self.navigationController?.pushViewController(webVC, animated: true)
        
    }
    
    func shopButtonInfo() {
        
        shopButton.layer.cornerRadius = 3
        shopButton.layer.shadowColor = UIColor.gray.cgColor // set the shadow color
        shopButton.layer.shadowOpacity = 3.9 // set the shadow opacity
        shopButton.layer.shadowOffset = CGSize(width: 0, height: 0) // set the shadow offset
        shopButton.layer.shadowRadius = 3 // set the shadow radius
        
    }
    
}
