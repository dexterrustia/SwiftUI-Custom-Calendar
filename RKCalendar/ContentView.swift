//
//  ContentView.swift
//  RKCalendar
//
//  Created by Raffi Kian on 7/14/19.
//  Copyright © 2019 Raffi Kian. All rights reserved.
//


import SwiftUI

struct ContentView : View {
     
    @State var startIsPresented = false
    
     
    @ObservedObject var rkManager2 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 1) // automatically goes to mode=2 after start selection, and vice versa.
    var currentDate = Date()
    let calendar = Calendar.current
    
    var body: some View {
        VStack (spacing: 25) {
            
            Button(action: { self.startIsPresented.toggle() }) {
                VStack {
                    Text("Example 2 - Range of Dates Selection").foregroundColor(.blue)
                    Text("(end date > start date)").foregroundColor(.blue)
                }
            }
            .sheet(isPresented: self.$startIsPresented, content: {
                RKViewController(
                    isPresented: self.$startIsPresented,
                    rkManager: self.rkManager2,
                    monthShowing: calendar.dateComponents([.month], from: self.rkManager2.startDate != nil ? self.rkManager2.startDate :  currentDate).month!
                                 )})
            VStack {
                Text("RESULT============")
                Text(self.getTextFromDate(date: self.rkManager2.startDate))
                Text(self.getTextFromDate(date: self.rkManager2.endDate))
                
                Text("RESULT============")
            }
            
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func datesView(dates: [Date]) -> some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(dates, id: \.self) { date in
                    Text(self.getTextFromDate(date: date))
                }
            }
        }.padding(.horizontal, 15)
    }
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return date == nil ? "" : formatter.string(from: date)
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
