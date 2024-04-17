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
            Text("Время отправления")
                .font(.bold24)
                .foregroundColor(.blackDay)
                .padding(.top, 24)
                .padding(.horizontal, 24)

            List {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.regular17)
                        Spacer()
                        if selectedOptions.contains(option) {
                            Image(systemName: "checkmark.square.fill")
                                .foregroundColor(.blackDay)
                                .onTapGesture {
                                    selectedOptions.remove(option)
                                }
                        } else {
                            Image(systemName: "square")
                                .foregroundColor(.blackDay)
                                .onTapGesture {
                                    selectedOptions.insert(option)
                                }
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedOptions.contains(option) {
                            selectedOptions.remove(option)
                        } else {
                            selectedOptions.insert(option)
                        }
                    }
                }
                .padding(.bottom, 24)
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)

            Text("Показывать варианты с пересадками")
                .font(.bold24)
                .foregroundColor(.blackDay)
                .padding(.horizontal, 24)
                .padding(.top, 24)

            List {
                ForEach(options2, id: \.self) { option in
                    HStack {
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
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedOption2 == option {
                            selectedOption2 = nil
                        } else {
                            selectedOption2 = option
                        }
                    }
                }
                .padding(.bottom, 24)
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
        }
        Spacer()
        findButton
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
    }

    private var findButton: some View {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Применить")
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
