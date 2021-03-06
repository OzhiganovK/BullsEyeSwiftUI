//
//  LeaderboardView.swift
//  SwiftUIBullseye
//
//  Created by Kostya Ozhiganov on 25.05.2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShown: Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack (spacing: 10.0){
                
                HeaderView(leaderboardIsShown: $leaderboardIsShown)
                LabelView()
                ScrollView{
                VStack(spacing: 10.0){
                    ForEach(game.leaderboardEntries.indices) { i in
                        let leaderboardEntry = game.leaderboardEntries[1]
                        RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
    }
        .background(
            RoundedRectangle(cornerRadius:
                .infinity)
                .strokeBorder(Color("LeaderboardRowColor"),
                lineWidth: Constants.General.strokeWidth)
            )
                .padding(.leading)
                .padding(.trailing)
                .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View{
    @Binding  var leaderboardIsShown: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
        
    var body: some View{
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else{
                    BigBoldText(text: "Leaderboard")
                }
            }
            .padding(.top)
            HStack{
                Spacer()
                Button(action: {
                    leaderboardIsShown = false
                }) {
                RoundedImageViewFilled(systemName: "xmark")
                    .padding(.trailing)
            }
        }
    }
}
}

struct LabelView: View{
    var body: some View{
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
           Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShown = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        Group {
            LeaderboardView(leaderboardIsShown: leaderboardIsShown, game: game)
            LeaderboardView(leaderboardIsShown: leaderboardIsShown, game: game)
                .previewLayout(.fixed(width: 568, height: 320))
        }
        Group {
            LeaderboardView(leaderboardIsShown: leaderboardIsShown, game: game)
                .preferredColorScheme(.dark)
            LeaderboardView(leaderboardIsShown: leaderboardIsShown, game: game)
                .previewLayout(.fixed(width: 568, height: 320))
        }
    }
}

