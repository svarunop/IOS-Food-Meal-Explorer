import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchMeals()
    }

    func fetchMeals() {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"
        AF.request(url).responseDecodable(of: MealResponse.self) { response in
            if let data = response.value {
                self.meals = data.meals ?? []
                self.tableView.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealTableViewCell
        cell.mealNameLabel.text = meal.strMeal

        // Load image
        if let url = URL(string: meal.strMealThumb) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.mealImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }

        return cell
    }
}
