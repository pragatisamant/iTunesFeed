//
//  ItemCell.swift
//  RebelTestPragati
//
//  Created by Pragati Samant on 20/07/19.
//  Copyright © 2019 Pragati. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptn: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    var result:Result?
    
    @IBAction func itemSelected(_ sender: Any) {
        
    }
    
    func configure(result:Result?) {
        self.result = result
        title.text = result?.name
        descriptn.text = result?.artistName
        fetchImage()
        
    }
    func fetchImage(){
        DataRequestHandler.fetchImage(result!.artworkUrl100){ data,error in
            if(data != nil) {
                self.image.image = UIImage.init(data: data!)
            }
        }
      //  RequestHandler().fetchImage(result?.artworkUrl100, completion:
    }
}
