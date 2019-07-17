//
//  FeedCollectionViewCell.swift
//  vimeo
//
//  Created by Eric Blancas on 7/17/19.
//  Copyright © 2019 Eric Blancas. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var createdAt: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var liked: UILabel!
    
    @IBOutlet weak var likedTime: UILabel!
    
    @IBOutlet weak var detailsView: UIView!
    
    @IBOutlet weak var optionsBtn: UIButton!
    
    
    override func awakeFromNib() {
        detailsView.layer.borderWidth = 0.3
        detailsView.layer.borderColor = UIColor.lightGray.cgColor
        optionsBtn.setTitle("● ● ●", for: .normal)
    }
    
    func injectDependencies(video: Video){
        title.text = video.title
        author.text = video.author
        thumbnail.setCustomImage(video.thumbnail)
        liked.text = "♡ liked by \(video.liked!)"
        duration.text = "\(video.duration!):00"
        likedTime.text = "\(video.likedTime!)h"
        createdAt.text = "\(video.plays!) plays ∙ \(video.createdAt!) years ago"

    }
    
}


