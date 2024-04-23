import SwiftUI

struct SelectStationView: View {
    let city: City
    let selectionType: SelectionType
    @EnvironmentObject var viewModel: ScheduleViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isNavigationActive = false
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            filteredStationsList
                .padding(.top, 16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarTitle(Constants.selectStation, displayMode: .inline)
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
            Text(Constants.stationNotFound)
                .foregroundColor(.blackDay)
                .font(.bold24)
                .padding()
        ) :
        AnyView(
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(filteredStations, id: \.self) { station in
                        NavigationLink(destination: TabBarView(), isActive: $isNavigationActive) {
                            HStack {
                                Text(station)
                                    .font(.regular17)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .imageScale(.large)
                            }
                            .contentShape(Rectangle())
                            .frame(height: 60)
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                handleStationSelection(station: station)
                            }
                        }
                        .foregroundColor(.blackDay)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
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
    .environmentObject(ScheduleViewModel())
}
