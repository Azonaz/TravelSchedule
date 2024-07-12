import SwiftUI

struct RoutesListCellView: View {
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    var route: Route

    var body: some View {
        let cellHeight: CGFloat = 104

        RoundedRectangle(cornerRadius: 24)
            .fill(.lightGrayUniversal)
            .frame(height: cellHeight)
            .frame(maxWidth: .infinity)
            .overlay {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        HStack {
                            Image(route.carrierLogo)
                                .resizable()
                                .frame(width: 36, height: 36)
                                .cornerRadius(12)

                            VStack(alignment: .leading) {
                                Text(route.carrierName)
                                    .font(.regular17)
                                    .foregroundStyle(.black)

                                if !route.transferCity.isEmpty {
                                    Text(route.transferCity)
                                        .font(.regular12)
                                        .foregroundStyle(.redUniversal)
                                } else {
                                    Text("")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.bottom, .top], 8)

                            Text(route.dateString)
                                .font(.regular12)
                                .foregroundStyle(.black)
                                .padding(.top, -16)
                        }

                    }
                    HStack {
                        Text(route.startTime)
                            .font(.regular17)
                            .foregroundStyle(.black)

                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.grayUniversal)
                        Text(route.travelDuration)
                            .font(.regular12)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.grayUniversal)
                        Text(route.finishTime)
                            .font(.regular17)
                            .foregroundStyle(.black)
                    }
                    .foregroundStyle(.black)

                }
                .padding(.horizontal, 16)
            }
    }
}

#Preview {
    RoutesListCellView(route: Route(carrierLogo: "rzdLogo",
                                      carrierName: "РЖД",
                                      transferCity: "С пересадкой в Костроме",
                                      dateString: "14 января",
                                      startTime: "22:30",
                                      finishTime: "08:15",
                                      travelDuration: "20 часов"))
}
