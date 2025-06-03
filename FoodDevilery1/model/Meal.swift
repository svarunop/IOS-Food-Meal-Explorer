//
//  Meal.swift
//  FoodDevilery1
//
//  Created by Atish Manala on 14/05/25.
//

import Foundation

// Represents a single meal item from the API
struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

// Represents the full response from the API
struct MealResponse: Codable {
    let meals: [Meal]?
}
