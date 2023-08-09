/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                NavigationLink("Faculties", destination: Faculty(landmark: landmark))
            }
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            BuildingImage(image: landmark.building)
                .offset(y: -200)
                .padding(.bottom, -200)
            
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
                HStack{
                    Text("About us")
                        .font(.title2)
                        .foregroundColor(.gray)
                    Spacer()
                        NavigationLink("More Info", destination: MoreInfo(landmark: landmark))
                    }
                
                    
                    
                    Text(landmark.description)
                }
            //.padding()
            //.padding()
                
                
                //NavigationLink {
                // LandmarkDetail(landmark: landmark)
                // } label: {
                // MoreInfo(landmark: landmark)
                // }
                
               // MapView(coordinate: landmark.locationCoordinate)
                    //.ignoresSafeArea(edges: .top)
                   // .frame(height: 300)
            }
            .padding()
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
    }
    
struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
