//
//  ExerciseView.swift
//  FitnessApp
//
//  Created by corey on 2/14/21.
//

import SwiftUI

protocol ExerciseViewHandlerProtocol {
    func passTheBuck()
}

struct ExerciseView: View {
    
    var delegate: ExerciseViewHandlerProtocol?
    
    var exerciseName: String = ""
    var sets: Int = 0
    var reps: Int = 0
    var columns: [GridItem] = [
        GridItem(.fixed(75), spacing: 15),
        GridItem(.fixed(75), spacing: 15),
        GridItem(.fixed(75), spacing: 15),
        GridItem(.fixed(75), spacing: 15)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // header for exercise, sets and reps (also last set/rep?)
            HStack{
                Text(exerciseName)
                    .font(.title)
                    .bold()
                Text(" | ")
                Text("\(sets) Sets")
                Text("x")
                Text("\(reps) Reps")
            }.padding(.top)
            // body containing bubbles for each set of the above exercise
            LazyVGrid(columns: columns, alignment: .center){
                ForEach(0..<sets) {w in
                    Circle()
                        .frame(height: 75, alignment: .center)
                        .overlay(
                            Button(String(reps), action: {
                                    handleTap()
                                    
                            })
                                .foregroundColor(.white)
                                .font(.title)
                        )
                }
            }
                .padding(.all)
        }//.border(Color.black)
    }
    func handleTap() {
        //print("handlin' tap, sending it to \(delegate)")
        delegate?.passTheBuck()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exerciseName: "Bench Press", sets: 3, reps: 5)
            .previewLayout(.sizeThatFits)
    }
}
