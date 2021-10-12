//
//  ViewController.swift
//  Weather_App_New
//
//  Created by Максим Гаврилюк on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager = NetworkManager()
    
    let imageBackground:UIImageView = {
       let imageBackground = UIImageView()
       imageBackground.translatesAutoresizingMaskIntoConstraints = false
       imageBackground.backgroundColor = .blue
       return imageBackground
    }()
    
    let iconWeather:UIImageView = {
       let iconWeather = UIImageView()
       iconWeather.translatesAutoresizingMaskIntoConstraints = false
       iconWeather.tintColor = .black
       iconWeather.contentMode = .scaleAspectFit
        

       return iconWeather
    }()
    
    let temparatureGeneral:UILabel = {
       let temperatureGeneral = UILabel()
       temperatureGeneral.translatesAutoresizingMaskIntoConstraints = false
       temperatureGeneral.backgroundColor = .clear
       temperatureGeneral.text = "90"
       temperatureGeneral.font = UIFont.init(name: "Futura", size: 49)
       temperatureGeneral.textAlignment = .center
        return temperatureGeneral
    }()
    
    let temperatureFeelsLike:UILabel = {
        let temperatureFeelsLike = UILabel()
        temperatureFeelsLike.translatesAutoresizingMaskIntoConstraints = false
        temperatureFeelsLike.backgroundColor = .clear
        temperatureFeelsLike.text = "80"
        temperatureFeelsLike.textAlignment = .center
        temperatureFeelsLike.font = UIFont.init(name: "Futura", size: 30)
        return temperatureFeelsLike
    }()
    
    let cityNameGeneral: UILabel = {
        let cityNameGeneral = UILabel()
        cityNameGeneral.translatesAutoresizingMaskIntoConstraints = false
        cityNameGeneral.backgroundColor = .clear
        cityNameGeneral.text = "Lviv"
        cityNameGeneral.font = UIFont.init(name: "Futura", size: 50)
        cityNameGeneral.textAlignment = .center
        return cityNameGeneral
    }()
    
    let searchPressed: UIButton = {
        let searchPressed = UIButton(type: .system)
        var imageSearch = UIImage(systemName: "magnifyingglass.circle")
        searchPressed.setImage(imageSearch, for: .normal)
        searchPressed.translatesAutoresizingMaskIntoConstraints = false
        searchPressed.addTarget(nil, action: #selector(searchPressedButton), for: .touchUpInside)
        return searchPressed
    }()
    
    let listPressed: UIButton = {
        let listPressed = UIButton(type: .system)
        listPressed.translatesAutoresizingMaskIntoConstraints = false
        listPressed.backgroundColor = .clear
        listPressed.setTitle("List", for: .normal)
        listPressed.titleLabel?.textColor = .black
        listPressed.addTarget(nil, action: #selector(listPressedButton), for: .touchUpInside)
        listPressed.titleLabel?.font = UIFont.init(name: "Futura", size: 15)
        listPressed.layer.cornerRadius = 15
        listPressed.layer.borderWidth = 1
        listPressed.layer.borderColor = UIColor.black.cgColor
        return listPressed
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        networkManager.fetchCurrentWeather(forCity: "London")
        networkManager.onCompletion = { [weak self] currentWeather in
            self?.updateInterfaceWith(weather: currentWeather)
            
        }
        
        
        
        
        view.addSubview(imageBackground)
        view.addSubview(iconWeather)
        view.addSubview(temparatureGeneral)
        view.addSubview(temperatureFeelsLike)
        view.addSubview(cityNameGeneral)
        view.addSubview(searchPressed)
        view.addSubview(listPressed)
        
        setupImageBackground()
        setupIconWeather()
        setupTemparatureGeneral()
        setupTemperatureFeelsLike()
        setupCityNameGeneral()
        setupSearchPressed()
        setupListPressed()
        
        
        
        
        
        
    }
    
    func updateInterfaceWith(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            self.cityNameGeneral.text = weather.cityName
            self.temparatureGeneral.text = weather.temperatureString
            self.temperatureFeelsLike.text = weather.feelsLikeTemperatureString
            self.iconWeather.image = UIImage(systemName: weather.systemIconNameString)
        }
    
    }
    
    
    

    func setupImageBackground() {
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: -10).isActive = true
        imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        imageBackground.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        imageBackground.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -10).isActive = true
    }
    
    func setupIconWeather() {
        iconWeather.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        iconWeather.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iconWeather.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/8).isActive = true
        iconWeather.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupTemparatureGeneral() {
        temparatureGeneral.topAnchor.constraint(equalTo: iconWeather.bottomAnchor, constant: 5).isActive = true
        temparatureGeneral.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temparatureGeneral.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6/8).isActive = true
        temparatureGeneral.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupTemperatureFeelsLike() {
        temperatureFeelsLike.topAnchor.constraint(equalTo: temparatureGeneral.bottomAnchor, constant: 5).isActive = true
        temperatureFeelsLike.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temperatureFeelsLike.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6/8).isActive = true
        temperatureFeelsLike.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
    }
    
    func setupCityNameGeneral() {
        cityNameGeneral.topAnchor.constraint(equalTo: temperatureFeelsLike.bottomAnchor, constant: 130).isActive = true
        cityNameGeneral.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityNameGeneral.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/8).isActive = true
        cityNameGeneral.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.3/2).isActive = true
    }
    
    func setupSearchPressed() {
        searchPressed.bottomAnchor.constraint(equalTo: listPressed.topAnchor, constant: -25).isActive = true
        searchPressed.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchPressed.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/12).isActive = true
        searchPressed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/5).isActive = true
        
    }
    
    func setupListPressed() {
        listPressed.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        listPressed.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        listPressed.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/30).isActive = true
        listPressed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
    }
    
    
    @objc func searchPressedButton() {
        print("Search")
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkManager.fetchCurrentWeather(forCity: city)
        }
    }
    @objc func listPressedButton() {
        print("List")
    }
    
    

}

