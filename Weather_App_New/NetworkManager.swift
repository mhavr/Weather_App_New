//
//  NetworkManager.swift
//  Weather_App_New
//
//  Created by Максим Гаврилюк on 12.10.2021.
//

import Foundation


struct NetworkManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    
    
    
    func fetchCurrentWeather(forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71bab58039db2654ec8cd860bf00beb9&units=metric"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
        
    }
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
           let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from:data )
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil









}



    

}
