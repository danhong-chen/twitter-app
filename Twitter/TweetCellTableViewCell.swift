//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Vivian Chen on 9/25/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBAction func favoriteButton(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited){
            TwitterAPICaller.client?.favoiriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite did not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoiriteTweet(tweetId: tweetId, success: {self.setFavorite(false)}, failure: { (error) in
                print("unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweetAButton(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in "Error is retweeting: \(error)" })
    }
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted) {
            retweenB.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweenB.isEnabled = false
        }
        else{
            retweenB.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweenB.isEnabled = true
        }
    }
    
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButtonO.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButtonO.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
        }
    }
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    @IBOutlet weak var TweetContent: UILabel!
    
    @IBOutlet weak var favButtonO: UIButton!
    
    @IBOutlet weak var retweenB: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
