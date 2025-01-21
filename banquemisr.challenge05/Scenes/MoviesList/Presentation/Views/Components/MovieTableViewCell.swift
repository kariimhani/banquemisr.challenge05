//
//  MovieTableViewCell.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieViewContainer: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieRatingCountLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.addCornerRadius(20.0)
    }
    
    func configure(
        _ model: MovieUIModel,
        isFirstItem: Bool,
        isLastItem: Bool
    ) {
        movieTitleLabel.text = model.title
        movieRatingLabel.text = model.rating
        movieRatingCountLabel.text = model.ratingCount
        movieImageView.download(
            using: model.imagePath,
            and: Constants.Image.Size.small
        )
        
        applyStylingBasedOnPosition(isFirstItem: isFirstItem, isLastItem: isLastItem)
    }
}


private extension MovieTableViewCell {
    func reset() {
        movieImageView.image = nil
        movieTitleLabel.text = nil
        movieViewContainer.resetCornerRadius()
    }
    
    func applyStylingBasedOnPosition(
        isFirstItem: Bool,
        isLastItem: Bool
    ) {
        if isFirstItem {
            movieViewContainer.addCornerRadius(20.0, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        } else if isLastItem {
            movieViewContainer.addCornerRadius(20.0, corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        }
    }
}
