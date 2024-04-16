import SwiftUI

struct SelectStationView: View {
    let city: City

    var body: some View {
        ZStack {
            SearchBarView()
            List(city.stations, id: \.self) { station in
                NavigationLink(destination: ContentView()) {
                    Text(station)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .padding(.top, 70)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationBarTitle("Выбор станции", displayMode: .inline)
    }
}

#Preview {
    SelectStationView(city: City(name: "Москва", stations: ["Ленинградский вокзал", "Киевский вокзал"]))
}
