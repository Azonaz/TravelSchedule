import SwiftUI

struct RoutesListView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    @State private var isSortButtonTapped = false

    var body: some View {
        VStack {
            Text("\(viewModel.fromText()) → \(viewModel.toText())")
                .font(.bold24)
                .foregroundColor(.blackDay)
                .padding(.bottom, 24)
                .padding(.horizontal, 16)
            ZStack {
                if viewModel.routes.isEmpty {
                    Text(Constants.noRoutes)
                        .foregroundColor(.blackDay)
                        .font(.bold24)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.routes) { route in
                                NavigationLink(destination: CarrierView()) {
                                    RoutesListCellView(route: route)
                                }
                                .listRowSeparator(.hidden)
                                .buttonStyle(PlainButtonStyle())
                                .contentShape(Rectangle())
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)
                }
            }
            sortButton
                .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
    }

    private var sortButton: some View {
        NavigationLink(destination: SortRoutesView(), isActive: $isSortButtonTapped) {
            Button(action: {
                isSortButtonTapped = true
            }, label: {
                Text(Constants.specifyTime)
                    .foregroundColor(.white)
                    .font(.bold17)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(.blueUniversal)
            .cornerRadius(16)
        }
    }
}

#Preview {
    RoutesListView()
        .environmentObject(ScheduleViewModel())
}
