//
//  SpinnerDisplayable.swift
//  apiRest
//
//  Created by Juan Manuel on 22/02/2023.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()// si lo queremos ocultar llamamos a hideSpinner
}

extension SpinnerDisplayable where Self : UIViewController {
    func showSpinner() { // manda a mostrar un spinner
        guard doesNotExistAnotherSpinner else { return } // primero verifica que no exista otro spinner
        configureSpinner() // si no existe un spinner configura un nuevo spinner en configureSpinner
    }
    
    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag = ViewValues.tagIdentifierSpinner // primero agrega un nuevo container, que hace una vista en toda la pantalla
        parentView.addSubview(containerView)
        containerView.fillSuperView()
        containerView.backgroundColor = .black.withAlphaComponent(ViewValues.opacityContainerSpinner)//lo agrega y lo pone transparente
        addSpinnerIndicatorToContainer(containerView: containerView)
    }
    
    private func addSpinnerIndicatorToContainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        containerView.addSubview(spinner)
        spinner.centerXY()
    }
    
    func hideSpinner(){
        if let foundView = parentView.viewWithTag(ViewValues.tagIdentifierSpinner) {//aca busca la vista con el identificador del spinner
            foundView.removeFromSuperview()
        }
    }
    
    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(ViewValues.tagIdentifierSpinner) == nil // aca verifica que no exista un spinner del padre, el controlador o el navigation
    }
    
    private var parentView: UIView {
        navigationController?.view ?? view
    }

}

