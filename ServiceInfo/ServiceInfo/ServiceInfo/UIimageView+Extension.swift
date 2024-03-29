//
//  UIimageView+Extension.swift
//  ServiceInfo
//
//  Created by Arseniy Apollonov on 29.03.2024.
//

import UIKit

// Kingfisher быстрее :/
extension UIImageView{
  func imageFrom(url:URL){
      DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}
