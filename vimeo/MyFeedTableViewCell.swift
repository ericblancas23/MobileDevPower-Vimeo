//
//  MyFeedTableViewCell.swift
//  vimeo
//
//  Created by Eric Blancas on 7/17/19.
//  Copyright © 2019 Eric Blancas. All rights reserved.
//

import UIKit

class MyFeedTableViewCell: UITableViewCell {
    
    let service = Service.sharedInstance
    
    @IBOutlet weak var collectionView: UICollectionView!

    var videos = [Video](){
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        service.getVideos(completion: { video in
            DispatchQueue.main.async {
                self.videos.append(video)
            }
        })

    }

}

extension MyFeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCollectionViewCell", for: indexPath) as? FeedCollectionViewCell else{ return UICollectionViewCell() }
        cell.injectDependencies(video: videos[indexPath.row])
        return cell
        
    }


}

