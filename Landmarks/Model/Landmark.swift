/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var motto: String
    var city: String
    var state: String
    var address: String
    var phone: String
    var hours: String
    var founded: String
    var viceChancellor: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var faculties: [String]

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case university = "University"
        case technikon = "Technikon"
        case college = "College"
    }

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var buildingImage: String
    var building: Image {
        Image(buildingImage)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
