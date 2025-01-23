//
//  MovieDetailViewController.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//

import UIKit
import Combine

class MovieDetailViewController: UIViewController {
    private let viewModel: any MovieDetailViewModelContract
    private var subscriptions: Set<AnyCancellable> = .init()
        
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    init(viewModel: any MovieDetailViewModelContract) {
        self.viewModel = viewModel
        
        super.init(nibName: Self.nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToMovieDetail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadMovie()
        
        if let navigationController = navigationController as? NavigationController {
            navigationController.enableLargeTitle(false)
            navigationController.setupBackgroundColor(.clear)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let navigationController = navigationController as? NavigationController {
            navigationController.enableLargeTitle()
            navigationController.setupDefaultAppearance()
        }
    }
}

private extension MovieDetailViewController {
    func subscribeToMovieDetail() {
        viewModel
            .detail
            .removeDuplicates(by: { $0.id == $1.id })
            .receive(on: DispatchQueue.main)
            .sink { [weak self] detail in
                self?.setupViews(using: detail)
            }
            .store(in: &subscriptions)
    }
    
    func setupViews(using detail: MovieDetailUIModel) {
        titleLabel.text = detail.title
        durationLabel.text = detail.duration
        descriptionTextView.text = detail.description
        backgroundImageView.download(using: detail.backgroundImagePath)
        posterImageView.download(
            using: detail.posterImagePath,
            and: Constants.Image.Size.small
        )
    }
}
