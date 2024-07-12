import SwiftUI

struct SelectCityView: View {
    let selectionType: SelectionType
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @State private var searchText = ""

    var body: some View {
        VStack {
            SearchBarView(searchText: $searchText)
            filteredCitiesList
                .padding(.top, 16)
        }
        .navigationBarTitle(Constants.selectCity, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }

    private var filteredCitiesList: some View {
        let filteredCities = scheduleViewModel.cities.filter { city in
            searchText.isEmpty || city.name.localizedCaseInsensitiveContains(searchText)
        }
        return AnyView(
            ZStack {
                if filteredCities.isEmpty {
                    VStack {
                        Text(Constants.cityNotFound)
                            .foregroundColor(.blackDay)
                            .font(.bold24)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(filteredCities, id: \.name) { city in
                                NavigationLink(destination: SelectStationView(city: city,
                                                                              selectionType: selectionType)) {
                                    HStack {
                                        Text(city.name)
                                            .font(.regular17)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .imageScale(.large)
                                    }
                                    .contentShape(Rectangle())
                                    .frame(height: 60)
                                    .padding(.horizontal, 16)
                                }
                                .foregroundColor(.blackDay)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
        )
    }
}

#Preview {
    SelectCityView(selectionType: .departure)
        .environmentObject(ScheduleViewModel())
}
