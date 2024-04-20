import SwiftUI

struct SelectCityView: View {
    let selectionType: SelectionType
    @EnvironmentObject var viewModel: ScheduleViewModel
    @State private var searchText = ""

    var body: some View {
        ZStack {
            SearchBarView(searchText: $searchText)
            filteredCitiesList
                .padding(.top, 70)
        }
        .navigationBarTitle(Constants.selectCity, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }

    private var filteredCitiesList: some View {
        let filteredCities = viewModel.cities.filter { city in
            searchText.isEmpty || city.name.localizedCaseInsensitiveContains(searchText)
        }
        return filteredCities.isEmpty ?
        AnyView(Text(Constants.cityNotFound)
            .foregroundColor(.blackDay)
            .font(.bold24)
            .padding()) :
        AnyView(
            List(filteredCities, id: \.name) { city in
                NavigationLink(destination: SelectStationView(city: city, selectionType: selectionType)) {
                    Text(city.name)
                }
                .listRowSeparator(.hidden)
            }
                .listStyle(.inset)
                .scrollContentBackground(.hidden)
        )
    }
}

#Preview {
    SelectCityView(selectionType: .departure)
}
