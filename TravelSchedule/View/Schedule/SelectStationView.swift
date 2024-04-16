import SwiftUI

struct SelectStationView: View {
    let city: City
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            SearchBarView()
            List(city.stations, id: \.self) { station in
                NavigationLink(destination: TabBarView()) {
                    Text(station)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .padding(.top, 70)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarTitle("Выбор станции", displayMode: .inline)
    }

    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(Color(.label))
        })
    }
}

#Preview {
    SelectStationView(city: City(name: "Москва", stations: ["Ленинградский вокзал", "Киевский вокзал"]))
}
