//
//  ItemCharacterTableViewCell.swift
//  apiRest
//
//  Created by Juan Manuel on 25/02/2023.
//

import UIKit

final class ItemCharacterTableViewCell : UITableViewCell {
    //MARK: - Public properties
    
    //MARK: - Private properties
    private let mainContainerView : UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.setHeightConstrain(with: ViewValues.defaultHeightContainerCell)
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.setWidthConstrain(with: ViewValues.defaultHeightContainerCell)
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    private let labelContainerStackVie: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(
            forTextStyle: .headline,
            compatibleWith: UITraitCollection(legibilityWeight: .bold))
        label.textColor = .systemBlue
        return label
        
    }()
    
    private let specieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.text = "🪦"
        return label
    }()
    
    
    
    //MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuUI()
        
    }
   
    private var task: Task<Void, Never>?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
    }
    
    //MARK: - Helpers
    
    private func configuUI(){
        selectionStyle = .none
        addSubview(mainContainerView)
        
        mainContainerView.setConstraints(
            top: topAnchor,
            right: rightAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            pRight: ViewValues.doublePading,
            pBottom: ViewValues.doublePading,
            pLeft: ViewValues.doublePading)
        
        mainContainerView.addSubview(characterImageView)
        characterImageView.setConstraints(
            top: mainContainerView.topAnchor,
            bottom: mainContainerView.bottomAnchor,
            left: mainContainerView.leftAnchor)
        
        mainContainerView.addSubview(labelContainerStackVie)
        labelContainerStackVie.setConstraints(
            top: mainContainerView.topAnchor,
            right: mainContainerView.rightAnchor,
            bottom: mainContainerView.bottomAnchor,
            left: characterImageView.rightAnchor,
            pTop: ViewValues.doublePading,
            pBottom: ViewValues.doublePading,
            pLeft: ViewValues.doublePading)
        
        [nameLabel, specieLabel, statusLabel].forEach{
            labelContainerStackVie.addArrangedSubview($0)
        }
}
    func configData(viewModel: ItemCharacterViewModel){
        nameLabel.text = viewModel.name
        specieLabel.text = viewModel.specie
        statusLabel.text = viewModel.status
        setImage(viewModel: viewModel)
        }
    
    private func setImage(viewModel: ItemCharacterViewModel) {
        characterImageView.addDefaultImage()
        if let data = viewModel.imageData {
            characterImageView.setImageFromData(data: data)
        } else {
            task = Task {
                let dataImage = await viewModel.getImageData()
                characterImageView.setImageFromData(data: dataImage)
            }
        }
    }
    
}

//MARK: - Extensions here
extension ItemCharacterTableViewCell: Reusable { }
