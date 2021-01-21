//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import Foundation

struct OnboardingDataModel {
    var animation: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(animation: "fast_food", heading: "Food worth Utensil Licking", text: "User will be able to give you live, chat and meet with people nearby."),
        OnboardingDataModel(animation: "dlivery_man", heading: "Express Delivery", text: "Connect helps you locate the people around you who are closest from your home."),
        OnboardingDataModel(animation: "payments_options", heading: "Don't worry About Payments", text: "User will be able to give you live, chat and meet with people nearby."),
    ]
}
