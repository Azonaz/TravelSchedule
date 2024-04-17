import SwiftUI

struct SelectStationView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    let city: City
    let selectionType: SelectionType
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isNavigationActive = false

    var body: some View {
        ZStack {
            SearchBarView()
            List(city.stations, id: \.self) { station in
                NavigationLink(destination: TabBarView(), isActive: $isNavigationActive) {
                    Text(station)
                }
                .listRowSeparator(.hidden)
                .onTapGesture {
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
    SelectStationView(city: City(name: "Москва", stations: ["Ленинградский вокзал", "Киевский вокзал"]),
                      selectionType: .departure)
}
