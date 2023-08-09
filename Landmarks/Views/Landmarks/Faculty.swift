//
//  Faculty.swift
//  Landmarks
//
//  Created by Nthabiseng Mohatla on 2023/07/27.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct Faculty: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    //var faculties = [String]()
    //var faculs = []
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        //ScrollView{
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)

                    Spacer()
                    landmark.image
                        .resizable()
                        .frame(width: 70, height: 60)
                }
                NavigationView{
                    List {
                            Text(landmark.faculties[0])
                            Text(landmark.faculties[1])
                            Text(landmark.faculties[2])
                            Text(landmark.faculties[3])
                            Text(landmark.faculties[4])
                            //Text(landmark.faculties[5])
                            //Text(landmark.faculties[6])
                    }
                    .navigationTitle("Faculties")
                }
                //.padding()
                .navigationTitle(landmark.name)
                .navigationBarTitleDisplayMode(.inline)
            }
            .padding()
        //}
    }
    
    struct Faculty_Previews: PreviewProvider {
        static let modelData = ModelData()
        
        static var previews: some View {
            Faculty(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
        }
    }
}

