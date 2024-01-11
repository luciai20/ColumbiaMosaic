//
//  ColumbiaMosaicMap.swift
//  ColumbiaMosaicFinal
//
//  Created by Lucia Perez-Saignac on 12/18/23.
//

import SwiftUI

@main
struct ColumbiaMosaicMap: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Previews_ColumbiaMosaicMap_Previews: PreviewProvider {
    static var previews: some View {
        VStack {

            Image("opening")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
                


        }
    }
}
