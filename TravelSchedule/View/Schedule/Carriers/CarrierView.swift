import SwiftUI

struct CarrierView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    @State private var isShowingMailComposer = false

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
                Button {
                    if let email = viewModel.carriers.first?.email,
                       let url = URL(string: "mailto:\(email)") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Text(viewModel.carriers.first?.email ?? "")
                        .font(.regular12)
                        .foregroundColor(.blueUniversal)
                }
            }
            VStack(alignment: .leading) {
                Text(Constants.phone)
                    .font(.regular17)
                    .foregroundColor(.blackDay)
                if let phone = viewModel.carriers.first?.phone {
                    Button {
                        if let phoneURL = URL(string: "tel://\(phone)") {
                            UIApplication.shared.open(phoneURL)
                        }
                    } label: {
                        Text(phone)
                            .font(.regular12)
                            .foregroundColor(.blueUniversal)
                    }
                }
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
        .environmentObject(ScheduleViewModel())
}
