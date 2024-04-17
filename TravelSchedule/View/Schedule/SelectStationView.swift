import SwiftUI

struct SelectStationView: View {
    let city: City
    let selectionType: SelectionType
    @EnvironmentObject var viewModel: ScheduleViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var searchText = ""

    var body: some View {
        ZStack {
            SearchBarView(searchText: $searchText)
            filteredStationsList
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

    private var filteredStationsList: some View {
        let filteredStations = city.stations.filter { station in
            searchText.isEmpty || station.localizedCaseInsensitiveContains(searchText)
        }
        return filteredStations.isEmpty ?
        AnyView(
            Text("Станции не найдены")
                .foregroundColor(.blackDay)
                .font(.bold24)
                .padding()
        ) :
        AnyView(
            List(filteredStations, id: \.self) { station in
                NavigationLink(destination: TabBarView(), isActive: $isNavigationActive) {
                    Text(station)
                }
                .listRowSeparator(.hidden)
                .onTapGesture {
                    handleStationSelection(station: station)
                }
            }
                .listStyle(.inset)
                .scrollContentBackground(.hidden)
        )
    }

    private func handleStationSelection(station: String) {
        switch selectionType {
        case .departure:
            viewModel.selectedFromCity = city
            viewModel.selectedFromStation = station
        case .arrival:
            viewModel.selectedToCity = city
            viewModel.selectedToStation = station
        }
        isNavigationActive = true
    }
}

#Preview {
    SelectStationView(city: City(name: "Москва", stations: ["Ленинградский вокзал", "Киевский вокзал"]),
                      selectionType: .departure)
}
