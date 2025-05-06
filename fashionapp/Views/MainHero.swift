//
//  MainHero.swift
//  fashionapp
//
//  Created by Rajayogan on 05/05/25.
//

import SwiftUI

struct MainHero: View {
    @State var isMain: Bool = true
    
    @State var letterWidths: [Int: Double] = [:]
    @State var curvedText = "EXPLORE & SHOP TODAY"
    
    var letterOffset:[(offset: Int, element: Character)] {
        return Array(curvedText.enumerated())
    }
    
    var radius: Double = 62
    
    var body: some View {
        if isMain {
            mainView
        }
        else {
            NewCollections()
        }
    }
    
    var mainView: some View {
        ZStack {
            //bg is a gradient
            LinearGradient(colors: [.bgtop, .bgbottom], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text("Remade")
                        .font(.custom("PTSerif-Bold", size: 30))
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.remadepinkdot)
                }
                ZStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Spacer()
                            .frame(height: 50)
                        ZStack {
                            Circle()
                                .frame(width: 350, height: 350)
                                .foregroundStyle(.palebrown)
                            Image("girlherobg")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 450, height: 400)
                                .mask {
                                    Circle()
                                        .frame(width: 450, height: 400)
                                        .offset(x: 100, y: -10)
                                }
                                .offset(x: -87, y:-15)
                            
                            VStack {
                                Spacer()
                                ZStack {
                                    HStack(spacing: 15) {
                                        Text("01")
                                            .font(.opensans(fontStyle: .title, fontWeight: .regular, fontSize: 15))
                                        Rectangle()
                                            .frame(width: 17, height: 2)
                                        Rectangle()
                                            .frame(width: 17, height: 2)
                                            .foregroundStyle(.gray)
                                        Rectangle()
                                            .frame(width: 17, height: 2)
                                            .foregroundStyle(.gray)
                                        Rectangle()
                                            .frame(width: 17, height: 2)
                                            .foregroundStyle(.gray)
                                        Rectangle()
                                            .frame(width: 17, height: 2)
                                            .foregroundStyle(.gray)
                                        Text("05")
                                            .font(.opensans(fontStyle: .title, fontWeight: .regular, fontSize: 15))
                                    }
                                    .offset(x: -225, y:-140)
                                    .rotationEffect(.degrees(90))
                                    Circle()
                                        .frame(width: 300, height: 175)
                                        .foregroundStyle(.white)
                                        .offset(x: 75)
                                    Circle()
                                        .strokeBorder(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: 1, dash:[7,7], dashPhase: 1))
                                        .frame(width: 275, height: 150)
                                        .foregroundStyle(.title)
                                        .offset(x: 75)
                                    Circle()
                                        .frame(width: 85)
                                        .foregroundStyle(.title)
                                        .offset(x: 75)
                                        .onTapGesture {
                                            withAnimation(.easeIn) {
                                                isMain = false
                                            }
                                        }
                                    Text("TAP")
                                        .font(.opensans(fontStyle: .title, fontWeight: .bold, fontSize: 18))
                                        .foregroundStyle(.white)
                                        .offset(x: 70, y:25)
                                        .rotationEffect(.degrees(-20))
                                        .onTapGesture {
                                            withAnimation(.easeIn) {
                                                isMain = false
                                            }
                                        }
                                    ForEach(letterOffset, id: \.offset) { index, letter in
                                        VStack {
                                            Text(String(letter))
                                                .font(.opensans(fontStyle: .body, fontWeight: .semibold, fontSize: 18))
                                                .kerning(4)
                                                .foregroundStyle(.title)
                                                .onGeometryChange(for: Double.self) { proxy in
                                                    proxy.size.width
                                                }action: { width in
                                                    letterWidths[index] = width
                                                }
                                            Spacer()
                                        }
                                        .rotationEffect(fetchAngle(at: index))
                                        
                                    }.frame(width: 134, height: 134)
                                        .rotationEffect(.degrees(210))
                                        .offset(x: 75, y: -1)
                                }
                            }
                        }
                        VStack(alignment: .leading, spacing: -10) {
                            Text("YOUR")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                            Text("STYLE WILL")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                            Text("TELL ABOUT")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                            Text("YOU")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                        }.padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 5))
                    }
                }
            }
        }
    }
    //Rotation Angle
func fetchAngle(at letterPosition: Int) -> Angle {
    let times2pi: (Double) -> Double = { $0 * 2 * .pi }
    let circumference = times2pi(radius)
    let finalAngle = times2pi(letterWidths.filter { $0.key <= letterPosition }.map(\.value).reduce(0, +) / circumference)
    return .radians(finalAngle)
}
}



#Preview {
    MainHero()
}
