//
//  ViewController.swift
//  AbhayDemo
//
//  Created by singsys on 14/06/24.
//

import UIKit



//struct jsonstruct: Decodable{
//    
//    let albumId: Int
//    let id: Int
//    let title: String
//    let thumbnailUrl: String
////    let body: String
//   
////    let userId: Int
//   
//}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var mytableview: UITableView!
    
    
    
   
    
  // Creating varible
    var arrdata = [jsonstruct] ()
    
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchdata()
        
        mytableview.dataSource = self
        mytableview.dataSource = self
        mytableview.register(UINib(nibName: "NewTabelViewCell", bundle: nil),
        forCellReuseIdentifier: "NewTabelViewCell")
    
        
    }
    
//    creating a funcation to fetch data and call API
    
   
    func fetchdata(){
        
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
          let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
//
        URLSession.shared.dataTask(with: url!) { data, respone, error in
            
            do{
                if error == nil{
                    
                     self.arrdata = try
                    JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                    for mainarr in self.arrdata{
                        
                        print("ID:",mainarr.id,"\nALBUMID:",mainarr.albumId,"\nTITLE:",mainarr.title,"\nURL:",mainarr.thumbnailUrl)
                        
                        DispatchQueue.main.async {
                            self.mytableview.reloadData()
                        }
                    }
                    
                }
            }
            catch {
                
                print("Error in get json data")
            }
            
        }.resume()
    }

  // Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewTabelViewCell = tableView.dequeueReusableCell(withIdentifier: "NewTabelViewCell") as! NewTabelViewCell
        cell.idlbl.text = "ID:\(arrdata[indexPath.row].id)"
        cell.albumidlbl.text = "ALBUMID:\(arrdata[indexPath.row].albumId)"
        cell.titlelbl.text = "Title:\(arrdata[indexPath.row].title)"
        cell.thumbnailUrl.text = "Thumbnail:\(arrdata[indexPath.row].thumbnailUrl)"
      
        let urlimage = URL(string: arrdata[indexPath.row].thumbnailUrl)
        cell.apiimage.downloadImage(from: urlimage!)
        
        return cell
        
    }
    
    
}

// For getting Image throw API
extension UIImageView {
    func downloadImage(from url: URL) {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}


