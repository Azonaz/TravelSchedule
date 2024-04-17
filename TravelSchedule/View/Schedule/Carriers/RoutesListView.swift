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
                Text("Уточнить время")
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
}
