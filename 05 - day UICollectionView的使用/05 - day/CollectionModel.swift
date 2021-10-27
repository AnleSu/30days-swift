//
//  CollectionModel.swift
//  05 - day
//
//  Created by Anlesu on 2021/1/18.
//

import UIKit

class CollectionModel: NSObject {
    var title = ""
    var descriptionContent = ""
    var image: UIImage!
    
    init(title: String, descriptionContent: String, image: UIImage!) {
        self.title = title
        self.descriptionContent = descriptionContent
        self.image = image
    }
    
    static func createDataSource() -> Array<CollectionModel> {
        return [
            CollectionModel(title: "Hello there, i miss u.", descriptionContent: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hello")!),
            CollectionModel(title: "🐳🐳🐳🐳🐳", descriptionContent: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "dudu")!),
            CollectionModel(title: "Training like this, #bodyline", descriptionContent: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "bodyline")!),
            CollectionModel(title: "I'm hungry, indeed.", descriptionContent: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "wave")!),
            CollectionModel(title: "Dark Varder, #emoji", descriptionContent: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "darkvarder")!),
            CollectionModel(title: "I have no idea, bitch", descriptionContent: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", image: UIImage(named: "hhhhh")!),
        ]
    }
    
}
