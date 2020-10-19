//
//  CountryDetailsViewController.swift
//  Project milestone 13-15
//
//  Created by Diego Sebastián Monteagudo Díaz on 10/19/20.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    
    var country: CountryDetails?
    
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var size: UILabel!
    
    
    override func viewDidLoad() {
        
        guard let country = country else { return }
        title = country.name
      
        capital.text = country.capital
        population.text = "\(country.population) millions"
        size.text = "\(country.size) km2"
       
    }
    
}
