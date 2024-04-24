import SwiftUI

struct CarrierView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    @State private var isShowingMailComposer = false

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                Image(viewModel.carriers.first?.carrierLogo ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity)
            }
            .frame(height: 104)
            .cornerRadius(24)
            .padding(.vertical, 16)
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
            .frame(height: 60)
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
            .frame(height: 60)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .navigationTitle(Constants.carrierInfo)
    }
}

#Preview {
    CarrierView()
        .environmentObject(ScheduleViewModel())
}
