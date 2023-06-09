//
//  ItemHomeMenuCell.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//

import UIKit

final class ItemHomeMenuCell : UICollectionViewCell{
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let mainContainer: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGroupedBackground
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
         view.layer.masksToBounds = true
         return view
     }()
     
     private let characterImage: UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: Images.defaultImages)
         imageView.contentMode = .scaleAspectFill
         return imageView
     }()
     
     private let titleCategoryLabel: UILabel = {
        let label = UILabel()
         label.textColor = .white
         label.font = UIFont.preferredFont(forTextStyle: .headline)
         return label
     }()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    private func configUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: ViewValues.doublePading)
        
        mainContainer.addSubview(characterImage)
                characterImage.fillSuperView()
        
        
        configGradientFortTitle()
               
               mainContainer.addSubview(titleCategoryLabel)
               titleCategoryLabel.setConstraints(
                   right: mainContainer.rightAnchor,
                   bottom: mainContainer.bottomAnchor,
                   left: mainContainer.leftAnchor,
                   pRight: ViewValues.doublePading,
                   pBottom: ViewValues.doublePading,
                   pLeft: ViewValues.doublePading)
               
           }
           
           private func configGradientFortTitle() {
               let gradientMaskLayer = CAGradientLayer()
               gradientMaskLayer.frame = self.bounds
               gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
               gradientMaskLayer.locations = [ViewValues.gradientTitleInit, ViewValues.gradientTitleEnd]
               mainContainer.layer.addSublayer(gradientMaskLayer)
        
    }
    
    func configData(viewModel: ItemHomeMenuViewModel){
        titleCategoryLabel.text = viewModel.title
        characterImage.image = UIImage(named: viewModel.imageName)
        }
    
    
    
}

// MARK: - Extensions here
extension ItemHomeMenuCell: Reusable { }
