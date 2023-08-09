//
//  BuildingImage.swift
//  Landmarks
//
//  Created by Nthabiseng Mohatla on 2023/07/16.
//  Copyright © 2023 Apple. All rights reserved.
//


import SwiftUI

struct BuildingImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            //.ignoresSafeArea(edges: .top)
            .frame(height: 300)
            //.shadow(radius: 7)
    }
}

struct BuildingImage_Previews: PreviewProvider {
    static var previews: some View {
        BuildingImage(image: Image("tut4"))
    }
}
