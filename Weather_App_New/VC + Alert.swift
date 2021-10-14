//
//  VC + Alert.swift
//  Weather_App_New
//
//  Created by Максим Гаврилюк on 11.10.2021.
//

import Foundation
import UIKit



extension ViewController {
    
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionhandler: @escaping(String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["Lviv","Poltava","Kyiv","Vinnitsia"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                completionhandler(cityName)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        
        present(ac, animated: true, completion: nil)
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

