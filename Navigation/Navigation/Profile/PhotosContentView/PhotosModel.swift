//
//  PhotosModel.swift
//  Navigation
//
//  Created by Иван Захаров on 24.05.2023.
//

import UIKit

struct Photos {
    let image: UIImage
    
    static func makeMockModel() -> [Photos] {
        var model = [Photos]()
        var count = 0
        for _ in 1...20  {
            count += 1
            model.append(Photos(image: UIImage(named: String(count))!))
        }
        return model
    }
}
