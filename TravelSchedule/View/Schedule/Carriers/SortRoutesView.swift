import SwiftUI

struct SortRoutesView: View {
    @State private var selectedOptions: Set<String> = []
    @State private var selectedOption2: String?
    @State private var isFindButtonTapped = false
    @Environment(\.presentationMode) var presentationMode
    let options = ["Утро 06:00 - 12:00", "День 12:00 - 16:00",
                   "Вечер 18:00 - 00:00", "Ночь 00:00 - 06:00"]
    let options2 = ["Да", "Нет"]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text(Constants.departureTime)
                    .font(.bold24)
                    .foregroundColor(.blackDay)
                    .padding(.vertical, 16)
                ForEach(options, id: \.self) { option in
                    HStack(spacing: 0) {
                        Text(option)
                            .font(.regular17)
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark.square.fill")
                                .imageScale(.large)
                                .foregroundColor(.blackDay)
                                .onTapGesture {
                                    selectedOptions.remove(option)
                                }
                        } else {
                            Image(systemName: "square")
                                .imageScale(.large)
                                .foregroundColor(.blackDay)
                                .onTapGesture {
                                    selectedOptions.insert(option)
                                }
                        }
                    }
                    .frame(height: 60)
                    .onTapGesture {
                        if selectedOptions.contains(option) {
                            selectedOptions.remove(option)
                        } else {
                            selectedOptions.insert(option)
                        }
                    }
                }
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(Constants.showTransfer)
                    .font(.bold24)
                    .foregroundColor(.blackDay)
                    .padding(.vertical, 16)
                ForEach(options2, id: \.self) { option in
                    HStack(spacing: 0) {
                        Text(option)
                            .font(.regular17)
                        Spacer()
                        if selectedOption2 == option {
                            Circle()
                                .stroke(.blackDay, lineWidth: 2)
                                .frame(width: 18)
                                .overlay(Circle().fill(.blackDay).frame(width: 7))
                                .onTapGesture {
                                    selectedOption2 = nil
                                }
                        } else {
                            Circle()
                                .stroke(.blackDay, lineWidth: 2)
                                .frame(width: 18)
                                .onTapGesture {
                                    selectedOption2 = option
                                }
                        }
                    }
                    .frame(height: 60)
                    .onTapGesture {
                        if selectedOption2 == option {
                            selectedOption2 = nil
                        } else {
                            selectedOption2 = option
                        }
                    }
                }
            }

            Spacer()

            findButton
                .padding(.bottom, 20)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton())
        }
        .padding(.horizontal, 16)
    }

    private var findButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text(Constants.apply)
                    .foregroundColor(.white)
                    .font(.bold17)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(.blueUniversal)
            .cornerRadius(16)
            .opacity(!selectedOptions.isEmpty || selectedOption2 != nil ? 1 : 0)
    }
}

#Preview {
    SortRoutesView()
}
