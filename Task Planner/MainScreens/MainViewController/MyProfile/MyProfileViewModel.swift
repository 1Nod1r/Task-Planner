//
//  MyProfileViewModel.swift
//  Task Planner
//
//  Created by Nodirbek Khudoyberdiev on 16/11/22.
//

import Foundation

class MyProfileViewModel {
    let model: [MyProfileModel] = [
        .init(imageName: "phone", title: "+971 52 657-0686", subtitle: "Phone Number"),
        .init(imageName: "envelope", title: "che.nevy@gmail.com", subtitle: "Email"),
        .init(imageName: "pin-alt", title: "UAE. Dubai", subtitle: "Location")
    ]
}
