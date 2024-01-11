//
//  File.swift
//  ColumbiaMosaicFinal
//
//  Created by Lucia Perez-Saignac on 12/18/23.
//
import SwiftUI

struct EventsListView: View {
    @ObservedObject var viewModel = EventViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.events, id: \.id) { event in
                VStack(alignment: .leading) {
                    Text(event.title).font(.headline)
                    Text("Date: \(event.date)")
                    Text("Time: \(event.time)")
                    Text("Location: \(event.location)")
                    Text("Type: \(event.type)")
                    Text("Category: \(event.category)")
                    Text(event.description).font(.subheadline)
                }
            }
            .navigationBarTitle("Events")
            .onAppear {
                viewModel.fetchEvents()
            }
        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
    }
}

