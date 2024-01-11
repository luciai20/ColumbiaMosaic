//
//  ContentView.swift
//  ColumbiaMosaic
//
//  Created by Lucia Perez-Saignac on 10/31/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id: UUID
    let coordinate: CLLocationCoordinate2D
    let imageName: String
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8075, longitude: -73.963036),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var searchText = ""
    
    let locations = [
        Location(id: UUID(), coordinate: CLLocationCoordinate2D(latitude: 40.8069165, longitude: -73.9636118), imageName: "concert"),
        Location(id: UUID(), coordinate: CLLocationCoordinate2D(latitude: 40.8079, longitude: -73.9622), imageName: "exhibits"),
        Location(id: UUID(), coordinate: CLLocationCoordinate2D(latitude: 40.810062, longitude: -73.9628768), imageName: "arts"),
        Location(id: UUID(), coordinate: CLLocationCoordinate2D(latitude: 40.8083, longitude: -73.963), imageName: "performing_arts")
        // Add more locations as needed
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region, interactionModes: .all, annotationItems: locations) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Image(location.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color.white.opacity(0.5)))
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .clipShape(Circle())
                    }
                }
                .edgesIgnoringSafeArea(.all)

                VStack {
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        ScrollView{
                            
                            HStack{
                                Text("4x4 Magazine         ")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 16, weight: .bold))
                                //Spacer()
                                Text("Open Mic • Media/Publications")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 14, weight: .light))
                                
                            }.frame(width: 350, height: 30, alignment: .topLeading)
                            Button(action: {
                                // Action for "Kill Your Darlings" button
                            }) {
                                Text("Kill Your Darlings")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.title)
                                    .frame(width: 350, height: 40, alignment: .topLeading)
                                    .edgesIgnoringSafeArea(.all)
                                    
                            }
                            
                            HStack{
                                
                                Image("date")
                                .resizable()
                                .frame(width: 20, height: 20)
                                    
                                Text("Oct 26th, 2023")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 14, weight: .medium))
                                
                                Image("time")
                                .resizable()
                                .frame(width: 20, height: 20)
                                Text("8:00pm - 10:00pm")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 14, weight: .medium))
                                
                                Image("locations")
                                .resizable()
                                .frame(width: 20, height: 20)
                                Text("Dodge 501")
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 14, weight: .medium))
                            }.frame(maxWidth: 350, maxHeight: 100, alignment: .leading)
                            
                            Image("killyourdarlings")
                                .resizable()
                                //.scaledToFill()
                                .frame(maxWidth: 300, maxHeight: 150, alignment: .leading)
                            
                            Divider()
                            
                            Text("A ritual for your crustiest love poems, a seance for your Percy Jackson fanfiction. Bring the drafts that haunt you and join us in communing with all our old, dead writing. xοxο, 4×4                                                                                                                                                                                                                                                                                                                                                                                                    ")
                                .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                        }
                        .padding()
                        .background(Rectangle().fill(Color.white.opacity(0.8)))
                        .overlay(Rectangle().stroke(Color.gray.opacity(0.5), lineWidth: 2))
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .leading)
                        .edgesIgnoringSafeArea(.all)
                    }
                    
                }
                
                VStack{
                    Spacer()
                    HStack {
                        VStack{
                            Button(action: {
                                withAnimation {}}) {
                                    Image("mapview")
                                }.frame(width: 10, height: 25)
                                .padding(.leading, 30)
                                .padding(.trailing, 50)
                                .padding(.top, 10)
                            Text("Map View    ")
                        }.padding(.top, 20)
                        VStack{
                            Button(action: {
                                withAnimation {}}) {
                                    Image("listview 1")
                                }
                                .frame(width: 10, height: 25)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            
                            Text("    List View    ")
                        }
                        .padding(.top, 30)
                        VStack{
                            Button(action: {
                                withAnimation {}}) {
                                    Image("savedblack")
                                }.frame(width: 10, height: 15)
                                .padding(.leading, 52)
                                .padding(.trailing, 30)
                            Text("Saved Events").padding(.leading, 10)
                        }.padding(.top, 40)
                    }.frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(Color(red: 185 / 255, green: 217 / 255, blue: 235 / 255))
                        .edgesIgnoringSafeArea(.all)
                }
                    
                

                VStack{
                    HStack{
                        HStack{
                            TextField("Search Events", text: $searchText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            
                            
                        }
                        .frame(width: 270, height: 30)
                        .background(Color(.white))
                        .cornerRadius(40)
                        .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(red: 68 / 255.0, green: 173 / 255.0, blue: 231 / 255.0), lineWidth: 3))
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                        
                        Button(action: {
                            withAnimation {}}) {
                            Image("filter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 65, height: 65)
                            }.padding(.trailing, 10)
                        
                        
                    }
                    Spacer()
                    
                    
                    
                }
                .padding(.top, 60)
                .padding(.bottom, 50)
                
                .edgesIgnoringSafeArea(.all)

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

