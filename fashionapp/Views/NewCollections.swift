//
//  NewCollections.swift
//  fashionapp
//
//  Created by Rajayogan on 05/05/25.
//

import SwiftUI

struct NewCollections: View {
    @State var selectedTab = 1
    @State var isTapped = false
    
    @State var searchString: String = ""
    
    //Data for grid
    var bags: [Backpack] = [
        Backpack(id: "one", backdrop: .paleblue, heroImg: "girltopleft", price: 45.50, model: "Tokyo_1977"),
        Backpack(id: "two", backdrop: .dullyellow, heroImg: "guytopright", price: 55.60, model: "Singapore_1945"),
        Backpack(id: "three", backdrop: .palepink, heroImg: "ladybottom", price: 45.50, model: "Paris_1963"),
        Backpack(id: "four", backdrop: .oceanblue, heroImg: "guybottomright", price: 45.50, model: "Tokyo_1977")
    ]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        if (isTapped) {
            ZStack {
                LinearGradient(colors: [.bgtop, .bgbottom], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("Remade")
                            .font(.custom("PTSerif-Bold", size: 30))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.remadepinkdot)
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: -10) {
                            Text("MOST")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                            Text("POPULAR")
                                .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                                .foregroundStyle(.title)
                        }.padding(EdgeInsets(top: 4, leading: 25, bottom: 20, trailing: 2))
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        //Searchbar
                        TextField("", text: $searchString, prompt: Text("Search")
                            .font(.opensans(fontStyle: .title, fontWeight: .regular, fontSize: 18))
                            .foregroundStyle(.gray)
                        ).safeAreaInset(edge: .leading) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .background(.white, in: .rect(cornerRadius: 20))
                        .frame(width: 300, height: 50)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .foregroundStyle(.slidercolor)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.palepink.opacity(0.3))
                                }
                                .frame(width: 20, height: 20)
                        }
                        Spacer()
                    }
                    ScrollView {
                        //Let's use a grid
                        LazyVGrid(columns: columns) {
                            ForEach(bags) { bag in
                                gridItem(details: bag)
                            }
                        }.padding()
                    }
                }
                customTabBar()
                    .offset(y: 10)
            }
        }
        else {
            ZStack {
                LinearGradient(colors: [.bgtop, .bgbottom], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("Remade")
                            .font(.custom("PTSerif-Bold", size: 30))
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.remadepinkdot)
                    }
                    VStack(alignment: .leading, spacing: -10) {
                        Text("NEW")
                            .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                            .foregroundStyle(.title)
                        Text("COLLECTIONS")
                            .font(.exo2(fontStyle: .title, fontWeight: .bold, fontSize: 50))
                            .foregroundStyle(.title)
                    }.padding(EdgeInsets(top: 4, leading: 2, bottom: 20, trailing: 2))
                    RoundedRectangleShape()
                        .fill(.paleblue)
                        .frame(width: 325, height: 200)
                        .rotationEffect(.degrees(180))
                    Spacer()
                        .frame(height: 75)
                    RoundedRectangleShape()
                        .fill(.palepink)
                        .frame(width: 325, height: 200)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("FOR MEN")
                        .frame(width: 45)
                        .font(.exo2(fontStyle: .title2, fontWeight: .bold, fontSize: 20))
                    
                    Image("guyincap")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 265)
                        .offset(x: 20, y: 60)
                    Spacer()
                }.offset(y: -145)
                    .padding(EdgeInsets(top: 5, leading: 75, bottom: 2, trailing: 1))
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            isTapped = true
                        }
                    }
                //a small adjustment to fit the image
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 225, height: 30)
                    .rotationEffect(.degrees(-9))
                    .offset(y: 51)
                    .foregroundStyle(.bgbottom)
                HStack(spacing: -30.0) {
                    Spacer()
                    Text("FOR WOMEN")
                        .frame(width: 80)
                        .font(.exo2(fontStyle: .title2, fontWeight: .bold, fontSize: 20))
                        .padding(EdgeInsets(top: 75, leading: 25, bottom: 0, trailing: 1))
                    
                    Image("ladyinred")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 275, height: 265)
                        .offset(y: 60)
                    Spacer()
                }.offset(y: 90)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 2, trailing: 1))
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            isTapped = true
                        }
                    }
                
                customTabBar()
            }
        }
    }
    
    @ViewBuilder
    func gridItem(details: Backpack) -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 175, height: 350)
                .foregroundStyle(.clear)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 175, height: 250)
                .foregroundStyle(details.backdrop)
                .offset(y: -50)
            Image(details.heroImg)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225, height: 225)
                .clipped()
                .offset(y: -38)
            Circle()
                .frame(width: 65)
                .foregroundStyle(.white)
                .offset(y: 70)
            Circle()
                .frame(width: 58)
                .foregroundStyle(.title)
                .offset(y: 70)
            Image(systemName: "handbag")
                .foregroundStyle(.white)
                .offset(y: 70)
            VStack(spacing: 7) {
                Text(details.model)
                    .font(.opensans(fontStyle: .title2, fontWeight: .semibold, fontSize: 18))
                    .foregroundStyle(.title)
                Text("$\(details.price, specifier: "%.2f")")
                    .font(.exo2(fontStyle: .title2, fontWeight: .bold, fontSize: 22))
                    .foregroundStyle(.title)
            }.offset(y: 135)
            
        }
    }
    
    @ViewBuilder
    func customTabBar() -> some View {
        VStack {
            Spacer()
            ZStack {
                Capsule()
                    .frame(width: 325, height: 60)
                    .foregroundStyle(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 7, x: 0, y: 10)
                HStack {
                    Spacer()
                    Image(systemName: selectedTab == 1 ? "house.fill" : "house")
                        .foregroundStyle(selectedTab == 1 ? .tabselected : .black)
                        .onTapGesture {
                            switchTabs(val: 1)
                        }
                    Spacer()
                    Image(systemName: selectedTab == 2 ? "bell.fill" : "bell")
                        .foregroundStyle(selectedTab == 2 ? .tabselected : .black)
                        .onTapGesture {
                            switchTabs(val: 2)
                        }
                    Spacer()
                    Image(systemName: selectedTab == 3 ? "handbag.fill" : "handbag")
                        .foregroundStyle(selectedTab == 3 ? .tabselected : .black)
                        .onTapGesture {
                            switchTabs(val: 3)
                        }
                    Spacer()
                    Image(systemName: selectedTab == 4 ? "hexagon.fill" : "hexagon")
                        .foregroundStyle(selectedTab == 4 ? .tabselected : .black)
                        .onTapGesture {
                            //lets use this to return to this screen
                            withAnimation(.easeIn) {
                                isTapped = false
                            }
                            switchTabs(val: 1)
                        }
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 35, bottom: 0, trailing: 35))
            }
        }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
    
    func switchTabs(val: Int) {
        selectedTab = val
    }
}

#Preview {
    NewCollections()
}

//We'll just draw one and then rotate it

//Lines are the borders
//Arcs are the corner rounded edges

//For more details on drawing shapes refer to my spring a surprise video !!!
struct RoundedRectangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerRadius: CGFloat = 40

        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false
        )
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        return path
    }
}
