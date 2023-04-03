//
//  ProductsListViewController.swift
//  HairStylist
//
//  Created by Stephen Byron on 2/26/23.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: ProductsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let nib = UINib(nibName: "ProductsListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ProductsListTableViewCell")
        
        viewModel = ProductsViewModel()
        viewModel.getProducts(url: APIEndpoint.endPoint)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.updateUI = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return viewModel.products.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsListTableViewCell") as! ProductsListTableViewCell
        
        let products = viewModel.products[indexPath.row]
        
        cell.productName.text = products.name
        cell.priceLabel.text = "$\(products.price)"
        cell.backgroundColor = UIColor.tertiarySystemGroupedBackground
        
        let url = products.imageLink
        cell.productImage.downloaded(from: url)
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionName: String
        switch section {
        case 0:
            sectionName = "Top Products"
        default:
            sectionName = ""
        }
        return sectionName
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let productsView = storyBoard.instantiateViewController(withIdentifier: "ProdcutsView") as! ProdcutsView
        
        let product = viewModel.products[indexPath.row]
        productsView.productNameText = product.name
        productsView.productDescriptionText = product.description
        productsView.productImageURL = URL(string: product.imageLink)
        productsView.productURL = URL(string: product.productLink)
        
        //MARK: Set the selectedProductURL property of the viewModel
//        viewModel.selectedProductURL = URL(string: product.productLink)



        self.navigationController?.pushViewController(productsView, animated: true)

        
        
        
    }
    
    
}

