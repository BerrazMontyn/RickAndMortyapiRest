//
//   MessageDisplayable.swift
//  apiRest
//
//  Created by Juan Manuel on 22/02/2023.
//

import UIKit

protocol  MessageDisplayable { }

extension  MessageDisplayable where Self : UIViewController {
    func presentAlert(message: String, title: String) {
        let alertController = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: AppLocalized.okButton, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
