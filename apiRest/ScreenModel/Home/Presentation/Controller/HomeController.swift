//
//  HomeController.swift
//  apiRest
//
//  Created by Juan Manuel on 20/02/2023.
//

import UIKit
import Combine

protocol HomeMenuViewControllerCoordinator: AnyObject {
    func didSelectMenuCell(model: MenuItem)
}

final class Homecontroller: UICollectionViewController {
    
    private let viewModel : HomeMenuViewModel
    private var cancellabel = Set<AnyCancellable>()
    private weak var coordinator: HomeMenuViewControllerCoordinator? // delegate, porque implementa el protocolo
    
    init(viewModel: HomeMenuViewModel, layaout: UICollectionViewFlowLayout, coordinator: HomeMenuViewControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(collectionViewLayout: layaout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        configUI()
        ConigCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController(){
        viewModel.state.receive(on: RunLoop.main)// Siempre vamos a recibir el estado de viewModel
            .sink{ [weak self] state in
                self?.hideSpinner()
            switch state {
                
            case .success:
                self?.collectionView.reloadData()
            case .loading:
                self?.showSpinner()
                
            case .fail(error: let error):
                self?.presentAlert(message: error, title: AppLocalized.error)
            }
        }.store(in: &cancellabel)
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
        
    }
    
    private func ConigCollectionView(){
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
        
        
    }


}

extension Homecontroller {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard
              let cell = collectionView.dequeueReusableCell(
                  withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier,
                  for: indexPath
              ) as? ItemHomeMenuCell
          else { return UICollectionViewCell() }
        
        let viewModelCell = viewModel.getItemMenuViewMode(indexPath: indexPath)
        cell.configData(viewModel: viewModelCell)
        
          return cell
      }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        viewModel.menuItemsCount
    }
}

extension Homecontroller {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.getMenuItem(indexPath: indexPath)
        coordinator?.didSelectMenuCell(model: model)
    }
}

extension Homecontroller : SpinnerDisplayable { }

extension Homecontroller : MessageDisplayable { }

