//
//  ListView.swift
//  ColumbiaMosaic
//
//  Created by Lucia Perez-Saignac on 11/5/23.
//
import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    //@State private var events = [Event]()
    @ObservedObject var viewModel = EventViewModel()
    
    var body: some View {
        ZStack{
            Color(red: 237 / 255, green: 246 / 255, blue: 251 / 255)
                            .edgesIgnoringSafeArea(.all)
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
            .padding(.top, 40)
            
            .edgesIgnoringSafeArea(.all)
            //Make this VStack an object where information will be filled with whatever is retrieved from the database
            //need to make this page scroll to see all available saved events
            
        
            ScrollView{
                
                HStack{
                    
                    Text("This Week's Events")
                        .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading, 20)
                    Spacer()
                    
                }.edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack{
                        ForEach(Array(viewModel.events.prefix(1)), id: \.id) { event in
                            VStack(alignment: .leading){
                                HStack{
                                    Text(event.type)
                                    .font(.system(size: 12, weight: .light))
                                    Text("•")
                                    Text(event.category)
                                    .font(.system(size: 12, weight: .light))
                                }
                                ZStack(alignment: .topTrailing) {
                                    Image("killyourdarlings")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, maxHeight: 200) 
                                    
                                    Image("savedblue")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                        .padding(10)
                                }
                                Text(event.title)
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 25, weight: .medium))
                                HStack{
                                    Text(event.date)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text("•")
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text(event.time)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text("•")
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text(event.location)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                }
                                Text(event.description)
                                    .font(.subheadline)
                                
                                
                            }.padding()
                                .frame(maxWidth: 350, maxHeight: 400, alignment: .topLeading) // Set the frame to the desired size
                                .edgesIgnoringSafeArea(.all)
                                .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                            .background(Color.white.opacity(0.75))
                            
                        }
                    }}.onAppear {
                        viewModel.fetchEvents()
                    }
                HStack{
                    Text("Upcoming Events")
                        .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading, 20)
                        .padding(.top, 30)
                    Spacer()
                }.edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack{
                        ForEach(Array(viewModel.events.dropFirst().prefix(2)), id: \.id) { event in
                            VStack(alignment: .leading){
                                HStack{
                                    Text(event.type)
                                    .font(.system(size: 12, weight: .light))
                                    Text("•")
                                    Text(event.category)
                                    .font(.system(size: 12, weight: .light))
                                }
                                ZStack(alignment: .topTrailing) {
                                    Image("boysandtheband")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, maxHeight: 200) // Set max height as needed
                                    
                                    Image("savedblue")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                        .padding(10) 
                                }
                                Text(event.title)
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))
                                    .font(.system(size: 25, weight: .medium))
                                HStack{
                                    Text(event.date)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text("•")
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text(event.time)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text("•")
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                    Text(event.location)
                                        .font(.system(size: 12, weight: .light))
                                        .padding(.bottom, 2)
                                }
                                Text(event.description)
                                    .font(.subheadline)
                                
                                
                            }.padding()
                                .frame(maxWidth: 350, maxHeight: 400, alignment: .topLeading) // Set the frame to the desired size
                                .edgesIgnoringSafeArea(.all)
                                .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                            .background(Color.white.opacity(0.75))
                            
                        }
                    }}.onAppear {
                        viewModel.fetchEvents()
                    }
                //Spacer()
                //edit this so that each one is vertical stack within the bigger horizontal stack
                
            }
            .padding(.top, 120)
            .edgesIgnoringSafeArea(.all)
            
                
                    VStack{
                        Spacer()
                        HStack {
                            VStack{
                                Button(action: {
                                    withAnimation {}}) {
                                        Image("mapview")
                                    }.frame(width: 10, height: 25)
                                    .padding(.leading, 30)
                                    .padding(.trailing, 40)
                                    .padding(.top, 10)
                                Text("Map View    ")
                            }.padding(.bottom, 5 )
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
                            .padding(.top, 5)
                            VStack{
                                Button(action: {
                                    withAnimation {}}) {
                                        Image("savedblack")
                                    }.frame(width: 10, height: 25)
                                    .padding(.leading, 52)
                                    .padding(.trailing, 30)
                                Text("Saved Events").padding(.leading, 10)
                            }.padding(.top, 5)
                        }.frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
                            .background(Color(red: 185 / 255, green: 217 / 255, blue: 235 / 255))
                            .edgesIgnoringSafeArea(.all)

                    
                }.frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                    .background(Rectangle().fill(Color(red: 185 / 255.0, green: 217 / 255.0, blue: 235 / 255.0).opacity(0.99)))
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 750)
                //.overlay(Rectangle().stroke(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255), lineWidth: 4))
            
            
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
        }
        
        
        
    }
    
        
    }
        


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

