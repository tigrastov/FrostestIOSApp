

import Foundation

struct Refregirant: Identifiable{
    let id: String = UUID().uuidString
    var name: String
    var desription: String
    var ratio: [Int : Float]
    var ratioOpt:[Int: Float]?
    var image: String
    
    /*
    
    init(name: String, description: String, ratio: [Int : Float], image: String) {
        self.name = name
        self.desription = description
        self.ratio = ratio
        self.image = image
    }
    */
}
