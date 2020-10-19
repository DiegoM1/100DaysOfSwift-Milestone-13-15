//
//  ViewController.swift
//  Project milestone 13-15
//
//  Created by Diego Sebastián Monteagudo Díaz on 10/19/20.
//

import UIKit

class ViewController: UITableViewController,CountryDetailsProtocol {
    var countries: [CountryDetails] = [CountryDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        if   let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                parse(json: data)
                return
            }
        }
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
        
    }
    func parse(json:Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(CountriesDetails.self, from: json) {
            countries = jsonPetitions.countries
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "countryCell") else { return UITableViewCell() }
        cell.textLabel?.text  = countries[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = countries[indexPath.row]
        
        guard  let vc = storyboard?.instantiateViewController(identifier: "countryDetails") as? CountryDetailsViewController else { return }
        vc.country = data
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

protocol CountryDetailsProtocol {
    var countries: [CountryDetails] { get set
    }
}

