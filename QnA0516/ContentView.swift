//
//  ContentView.swift
//  QnA0516
//
//  Created by TsengWen on 2024/5/20.
//

import SwiftUI

struct Question{
    var text:String
    var answer:String
}


struct ContentView: View {
   @State private var questions: [Question] = [
        Question(text: "台灣的國花", answer: "梅花"),
        Question(text: "台灣最高的大樓", answer: "台北101大樓"),
        Question(text: "台灣最著名酒類", answer: "高粱酒"),
        Question(text: "台灣最長的河流", answer: "濁水溪"),
        Question(text: "台灣最高的山", answer: "玉山"),
        Question(text: "台灣最大的湖泊", answer: "日月潭"),
        Question(text: "台灣的首都", answer: "台北"),
        Question(text: "台灣最北端的地標", answer: "北海岸公園"),
        Question(text: "台灣最南端的地標", answer: "鵝鑾鼻"),
        Question(text: "台灣最長的海岸線位於哪個縣市", answer: "屏東縣")
    ]
    
    @State var currentQuestionIndex: Int = 0
    @State var showAnswer: Bool = false
    
    var body: some View {
        ZStack {
            Color.mint.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Text("\(currentQuestionIndex+1)")
                    .font(.largeTitle)
                
                Text("台灣小知識")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.orange)
                
                
                Spacer()
                
                Text(questions[currentQuestionIndex].text)
                    .font(.title)
                    .padding()
            
                Spacer()
                
                
                if showAnswer {
                    Text(questions[currentQuestionIndex].answer)
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                        .foregroundColor(.red)
                }
                
                
                Spacer()
                
                Button(action: {
                    showAnswer.toggle()
                }) {
                    Text("顯示答案")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                Button(action: {
                    nextQuestion()
                }) {
                    Text("下一題")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                .disabled(currentQuestionIndex+1 == questions.count ? true : false)
                if currentQuestionIndex == questions.count - 1 {
                    Button("Replay") {
                        currentQuestionIndex = 0
                        questions.shuffle()
                       
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .padding()
        }
        .onAppear(perform: {
            questions.shuffle()
        })
    }
    
      func nextQuestion() {
          currentQuestionIndex += 1
          showAnswer = false
    }
}

#Preview {
    ContentView()
}
