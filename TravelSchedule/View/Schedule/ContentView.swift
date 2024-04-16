import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ScheduleViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                StoryPreView()
                ZStack {
                    BlueRectangle()
                    HStack {
                        WhiteRectangle()
                        Spacer()
                        ReplaceCircle()
                    }
                }
                FindButton()
            }
            .navigationBarHidden(true)
        }
    }
}

struct BlueRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blueUniversal)
            .frame(height: 128)
            .padding(.horizontal, 16)
    }
}

struct WhiteRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white)
            .frame(height: 96)
            .overlay(
                VStack(alignment: .leading, spacing: 28) {
                    FromButton()
                    ToButton()
                }
            )
            .padding(.leading, 32)
    }
}

struct ReplaceCircle: View {
    var body: some View {
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
}

struct FromButton: View {
    var body: some View {
        NavigationLink(destination: SelectCityView().navigationBarTitle("Выбор города")) {
            Text("Откуда")
                .foregroundColor(.grayUniversal)
                .font(.regular17)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
        }
    }
}

struct ToButton: View {
    var body: some View {
        NavigationLink(destination: SelectCityView().navigationBarTitle("Выбор города")) {
            Text("Куда")
                .foregroundColor(.grayUniversal)
                .font(.regular17)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 16)
        }
    }
}

struct FindButton: View {
    var body: some View {
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
