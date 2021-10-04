//
//  CSImageSearchResultViewController.swift
//  cvs-test
//
//  Created by Md Shohrab Hossain on 10/3/21.
//

import Foundation
import UIKit


class CSImageSearchResultViewController: UIViewController {
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    let searchController = UISearchController()
    var viewModel: CSSearchResultViewModel?
    var selectedImage: CSImageCollectionCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SegueKey.imageDetails,
           let imageDetailsController = segue.destination as? CSImageDetailsViewController {
            imageDetailsController.selectedImage = selectedImage
          }
    }

    func fetchSearchResult(_ searchText: String) {
        if searchText == "" {
            self.viewModel = CSSearchResultViewModel(images: [])
            self.imagesCollectionView.reloadData()
            return
        }
        let encodedSearchText = searchText.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? searchText
        CSWebServiceClient.shared.searchImage(encodedSearchText) { images, error in
            DispatchQueue.main.async {
                self.viewModel = CSSearchResultViewModel(images: images)
                self.imagesCollectionView.reloadData()
            }
        }
    }

}

extension CSImageSearchResultViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            return
        }
        fetchSearchResult(searchText)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchSearchResult(searchText)
    }
}

extension CSImageSearchResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CSImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellKey.resultCollectionCell, for: indexPath) as! CSImageCollectionViewCell
        if let viewModel = viewModel {
            cell.viewModel = CSImageCollectionCellViewModel(image: viewModel.images![indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfSections
    }
}

extension CSImageSearchResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CSImageCollectionViewCell {
            selectedImage = cell.viewModel
        }
        performSegue(withIdentifier: SegueKey.imageDetails, sender: self)
    }
}
