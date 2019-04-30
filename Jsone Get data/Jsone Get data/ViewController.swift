//
//  ViewController.swift
//  Jsone Get data
//
//  Created by om technology on 29/04/19.
//  Copyright © 2019 Panini Academy. All rights reserved.
//

import UIKit
struct jsonstruct:Decodable {
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
    
}
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var arrdata=[jsonstruct]()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        getdata()
    
    }

    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for mainarr in self.arrdata{
                    print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                     self.tableView.reloadData()
                    }
                    
                }
                }
                
            }catch{
                print("Error in get json data")
            }
            
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let  lblCountryName:UILabel = (cell .viewWithTag(101) as? UILabel)!
         let  lblCountryCapital:UILabel = (cell .viewWithTag(102) as? UILabel)!
        lblCountryName.text="Name:\(arrdata[indexPath.row].name)"
        lblCountryCapital.text="Capital:\(arrdata[indexPath.row].capital)"
        cell.contentView .addSubview(lblCountryName)
        cell.contentView .addSubview(lblCountryCapital)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var details = DetailsViewController()
        details = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        details.regionstr = "Region :\(arrdata[indexPath.row].region)"
        details.subregionstr = "Subregion : \(arrdata[indexPath.row].subregion)"
        details.alph3str = "Alpha3code : \(arrdata[indexPath.row].alpha3Code)"
        details.alph2str = "Alpha2Code :\(arrdata[indexPath.row].alpha2Code)"
        self.navigationController?.pushViewController(details, animated: true)
    }
}

