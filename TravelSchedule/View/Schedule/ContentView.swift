import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    @State private var fromSelectionType: SelectionType?
    @State private var toSelectionType: SelectionType?

    var body: some View {
        NavigationStack {
            VStack {
                StoryPreView()
                ZStack {
                    blueRectangle
                    HStack {
                        whiteRectangle
                        Spacer()
                        replaceCircle
                    }
                }
                findButton
            }
            .navigationBarHidden(true)
        }
    }

    private var blueRectangle: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blueUniversal)
            .frame(height: 128)
            .padding(.horizontal, 16)
    }

    private var whiteRectangle: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(height: 96)
            .overlay(
                VStack(alignment: .leading, spacing: 28) {
                    fromButton
                    toButton
                }
            )
            .padding(.leading, 32)
    }

    private var replaceCircle: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 36)
            .overlay(
                Image(.change)
                    .foregroundStyle(Color.blueUniversal)
                    .onTapGesture {
                    }
            )
            .padding(.trailing, 32)
    }

    private var fromButton: some View {
        NavigationLink(destination: SelectCityView(selectionType: .from).navigationBarTitle("Выбор города"),
                       tag: SelectionType.from, selection: $fromSelectionType) {
            Text(viewModel.fromText())
                .foregroundColor(viewModel.selectedFromStation == nil
                                 ? .grayUniversal : .blackDay)
                .font(.regular17)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
        }
    }

    private var toButton: some View {
        NavigationLink(destination: SelectCityView(selectionType: .to).navigationBarTitle("Выбор города"),
                       tag: SelectionType.to, selection: $toSelectionType) {
            Text(viewModel.toText())
                .foregroundColor(viewModel.selectedToStation == nil
                                 ? .grayUniversal : .blackDay)
                .font(.regular17)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
        }
    }

    private var findButton: some View {
        Button(action: {

        }, label: {
            Text("Найти")
                .foregroundColor(.white)
                .font(.bold17)
        })
        .frame(width: 150, height: 60)
        .background(.blueUniversal)
        .cornerRadius(16)
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
