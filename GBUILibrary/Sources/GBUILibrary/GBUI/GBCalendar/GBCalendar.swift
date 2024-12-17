//
//  GBCalendar.swift
//  ClimbProject
//
//  Created by Guillaume Blanchet on 21/10/2024.
//

import SwiftUI

public struct GBCalendar: View {

    @State private var selectedDate: Date
    @State private var StartDate = Date()
    @State private var endDate = Calendar.current.date(byAdding: .month, value: 3, to: Date())!
    @State private var timeSlots: [Date] = []
    @State private var selectedTimeSlot: Date?

    var color: Color

    public init(date: Date = Date(), color: Color = .blue) {
        self.selectedDate = date
        self.color = color

        self._timeSlots = State(initialValue: generateTimeSlots(for: date))
    }

    public var body: some View {
        VStack {
            if #available(iOS 17.0, *) {
                DatePicker(
                    "Date",
                    selection: $selectedDate,
                    in: StartDate...endDate,
                    displayedComponents: [.date]
                )
                .onChange(of: selectedDate) { oldValue, newValue in
                    selectedTimeSlot = nil
                    timeSlots = generateTimeSlots(for: newValue)
                }
                .datePickerStyle(.graphical)
                .accentColor(color)
                .padding(16)
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                HStack {
                    ForEach(timeSlots, id: \.self) { timeSlot in
                        GBCalendarButton(
                            title: formatTime(date: timeSlot),
                            color: color,
                            isEnabled: true,
                            isSelected: .constant(selectedTimeSlot == timeSlot)
                        ) {
                            selectedTimeSlot = timeSlot
                            let formatter = DateFormatter()
                            formatter.dateStyle = .long
                            formatter.timeStyle = .short

                            print("Selected time slot: \(formatter.string(from: timeSlot))")
                        }
                    }
                }
                .padding(4)
                .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                // Fallback on earlier versions
                Text("Ce service n'est pas disponible pour votre version d'iOS")
            }
        }.background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding(.horizontal)
    }

    private func generateTimeSlots(for date: Date) -> [Date] {
        let calendar = Calendar.current
        return [
            calendar.date(bySettingHour: 12, minute: 30, second: 0, of: date)!,
            calendar.date(bySettingHour: 14, minute: 30, second: 0, of: date)!,
            calendar.date(bySettingHour: 16, minute: 30, second: 0, of: date)!,
            calendar.date(bySettingHour: 18, minute: 30, second: 0, of: date)!
        ]
    }

    private func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH'h'mm"
        return formatter.string(from: date)
    }
}

#Preview {
    GBCalendar()
}
