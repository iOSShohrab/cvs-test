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
                "Width:\t\t \(parse(using: "width=\""))",
                "Height:\t\t \(parse(using: "height=\""))"
            ]
            detailsTableView.reloadData()
        }
    }
    
    private func loadImage() {
        imageView.sd_setImage(with: selectedImage?.imageUrl, placeholderImage: nil)
    }
    
    // TODO :: Can be parse with Regex
    private func parse(using key: String) -> String {
        guard let description = selectedImage?.description
        else {
            return "-"
        }
        let values = description.components(separatedBy: key)
        if values.count > 0, let width = values[1].components(separatedBy: "\"").first {
            return width
        }
        return "-"
    }
}

extension CSImageDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellKey.detailsTableCell, for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

