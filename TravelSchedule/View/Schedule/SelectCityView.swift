import SwiftUI

struct SelectCityView: View {
    let selectionType: SelectionType
    @EnvironmentObject var viewModel: ScheduleViewModel

    var body: some View {
        ZStack {
            SearchBarView()
            List(viewModel.cities, id: \.name) { city in
                NavigationLink(destination: SelectStationView(city: city, selectionType: selectionType)) {
                    Text(city.name)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .padding(.top, 70)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }
}

#Preview {
    SelectCityView(selectionType: .from)
}
