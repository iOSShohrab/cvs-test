//
//  CSImageDetailsViewController.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import UIKit
import SDWebImage

class CSImageDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: CSImageCollectionCellViewModel?
    
    
    private var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
        loadImage()
    }
    
    private func populateData() {
        if let image = selectedImage {
            data = [
                "Title:\t\t \(image.title)",
                "Author:\t\t \(image.author)",
                "Width:\t\t \(parseWidth())"
            ]
            detailsTableView.reloadData()
        }
    }
    
    private func loadImage() {
        imageView.sd_setImage(with: selectedImage?.imageUrl, placeholderImage: UIImage(named: "placeholder"))
    }
    
    private func parseWidth() -> String {
        return "240"
    }
}

extension CSImageDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

