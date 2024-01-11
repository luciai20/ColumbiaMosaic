import SwiftUI

struct SaveView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = EventViewModel()
    
    
    var body: some View {
        ZStack{
            
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
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255), lineWidth: 4))
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    
                    Button(action: {
                        withAnimation {}}) {
                        Image("signin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        }.padding(.trailing, 10)
                    
                    
                }
                Spacer()
                
                
                
            }
            .padding(.top, 60)
            .padding(.bottom, 50)
            
            .edgesIgnoringSafeArea(.all)
            //Make this VStack an object where information will be filled with whatever is retrieved from the database
            //need to make this page scroll to see all available saved events
            ScrollView {
                VStack {
                    ForEach(viewModel.events, id: \.id) { event in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(event.title)
                                    .font(.title)
                                    .foregroundColor(Color(red: 2 / 255, green: 19 / 255, blue: 78 / 255))

                                Spacer()

                                Image("savedblue")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 22)
                            }

                            Text("Date: \(event.date)")
                            Text("Time: \(event.time)")
                            Text("Location: \(event.location)")
                            Text("Type: \(event.type)")
                            Text("Category: \(event.category)")
                            Text(event.description)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: 350, maxHeight: 400, alignment: .topLeading)
                        .background(Color.white.opacity(0.75))
                        .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                    }
                }
            }
            .padding(.top, 120)
            .onAppear {
                viewModel.fetchEvents()
            }
           
            
            //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
        }
        
        
        
    }
    
        
    }
        


struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView()
    }
}

struct Previews_SaveView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

