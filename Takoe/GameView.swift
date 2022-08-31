//
//  GameView.swift
//  Takoe
//
//  Created by Andy on 26.03.2022.
//

import SwiftUI


struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    
    var body: some View {
        
        GeometryReader{geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: viewModel.colums, spacing: 10) {
                    ForEach(0..<100){i in
                        ZStack{
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: viewModel.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            viewModel.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(viewModel.isGameboardDisable)
            .padding()
            .alert(item: $viewModel.alertItem, content: {alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.massage,
                      dismissButton: .default(alertItem.buttonTitle, action: {viewModel.resetGame()}))
            })
        }
    }
}

enum Player{
    case human, computer
}

struct Move{
    let player: Player
    let boardIndex: Int
    
    var indicator: String{
        return player == .human ? "xmark" : "circle"
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.purple).opacity(0.6)
            .frame(width: proxy.size.width/10-5,
                   height: proxy.size.width/10-5)
            .shadow(radius: 7)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.black)
            
    }
}
