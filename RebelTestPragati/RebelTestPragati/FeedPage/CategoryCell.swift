//
//  CategoryCell.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 20/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import UIKit
protocol CategoryCellDelegate {
    func handleItemSelection()
}
class CategoryCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate{
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var itemsCollectionView:UICollectionView!
    var delegate:CategoryCellDelegate?
    var feed:Feed?
      var requestHandler:RequestHandler<ItunesModel>?
    @IBAction func seeAll(_ sender: Any) {
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      //  return 10
        return feed?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =    collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCell
        cell.configure(result: feed?.results[indexPath.row])
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ItemCell
        currentResult = cell.result
        delegate?.handleItemSelection()
    }
    
    func configureFlowLayout() {
        //return
        let layout = UICollectionViewFlowLayout()
        var size:CGFloat
        size =  itemsCollectionView.frame.height - 16
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: size, height: size + 100)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        
        itemsCollectionView.collectionViewLayout = layout
        itemsCollectionView.collectionViewLayout.invalidateLayout()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(feed: Feed?) {
        categoryTitle.text = feed?.title
        self.feed = feed
        self.itemsCollectionView.reloadData()
    }
    func fetchData(url:String ) {
        
        
        requestHandler = RequestHandler<ItunesModel>()
        requestHandler?.myRequest(url , params: nil as Any?, {[unowned self] (itunes, error) in
            if(error != nil) {
                (self.delegate as! ViewController).showAlert(message: error.debugDescription)
            }else {
                self.configure(feed: itunes?.feed)
            }
        })
    }
}



