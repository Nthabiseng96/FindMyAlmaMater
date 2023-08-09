//
//  MoreInfo.swift
//  Landmarks
//
//  Created by Nthabiseng Mohatla on 2023/07/17.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct MoreInfo: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    //.ignoresSafeArea(edges: .top)
    var body: some View {
        ScrollView {
            BuildingImage(image: landmark.building)
                .ignoresSafeArea(edges: .top)
            //.resizable()
                .scaledToFill()
                //.frame(height: 200)
                .clipped()
                .offset(y: -1)
                .padding(.bottom, -1)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    
                    Spacer()
                    landmark.image
                        .resizable()
                        .frame(width: 70, height: 60)
                }
                
                HStack {
                    Text(landmark.motto)
                    Spacer()
                    VStack{
                        Text(landmark.city)
                        Text(landmark.state)
                    }
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
            }
            //.padding()
            HStack {
                Text("Phone:")
                    .font(.title2)
                    .foregroundColor(.gray)
                Text(landmark.phone)
            }
            Spacer()
            HStack {
                Text("Hours:")
                    .font(.title2)
                    .foregroundColor(.gray)
                Text(landmark.hours)
            }
            Spacer()
            //Spacer()
            HStack {
                Text("Founded:")
                    .font(.title2)
                    .foregroundColor(.gray)
                Text(landmark.founded)
            }
            //Spacer()
            HStack {
                Text("Vice Chancellor:")
                    .font(.title2)
                    .foregroundColor(.gray)
                Text(landmark.viceChancellor)
            }
            Spacer()
            HStack{
                Spacer()
                Text("Address:")
                    .font(.title2)
                    .foregroundColor(.gray)
                Text(landmark.address)
                Spacer()
            }
        }
        .padding()
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
       
    }
    
    
    
    
    struct MoreInfo_Previews: PreviewProvider {
        static let modelData = ModelData()
        
        static var previews: some View {
            MoreInfo(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
        }
    }
}

