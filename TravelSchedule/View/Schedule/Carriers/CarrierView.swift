import SwiftUI

struct CarrierView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(viewModel.carriers.first?.carrierLogo ?? "")
                .cornerRadius(24)
            Text(viewModel.carriers.first?.carrierName ?? "")
                .font(.bold24)
                .foregroundColor(.blackDay)
            VStack(alignment: .leading) {
                Text(Constants.email)
                    .font(.regular17)
                    .foregroundColor(.blackDay)
                Text(viewModel.carriers.first?.email ?? "")
                    .font(.regular12)
                    .foregroundColor(.blueUniversal)
            }
            VStack(alignment: .leading) {
                Text(Constants.phone)
                    .font(.regular17)
                    .foregroundColor(.blackDay)
                Text(viewModel.carriers.first?.phone ?? "")
                    .font(.regular12)
                    .foregroundColor(.blueUniversal)
            }
            Spacer()

        }
        .padding(.top, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationTitle(Constants.carrierInfo)
    }
}

#Preview {
    CarrierView()
}
