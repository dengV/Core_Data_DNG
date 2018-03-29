

import UIKit

//
import CoreData


class ViewControllerDog: UIViewController {

  // MARK: - Properties
  lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
  }()

  var managedContext: NSManagedObjectContext!
  
  //var walks: [Date] = []
  var currentDog: Dog?
  
  
  // MARK: - IBOutlets
  @IBOutlet var tableView: UITableView!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    guard let app_delegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    managedContext = app_delegate.coreDataStack.managedContext
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    let dogName = "Dido"
    let dogFetch: NSFetchRequest<Dog> = Dog.fetchRequest()
    dogFetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Dog.name), dogName)
    do {
         let results = try managedContext.fetch(dogFetch)
         if results.count > 0{
             currentDog = results.first
         }
         else{
             currentDog = Dog(context: managedContext)
         }
         currentDog?.name = dogName
         try managedContext.save()
         //tableView.reloadData()
    } catch let error as NSError {
      print("Fetch error: \(error) description: \(error.userInfo)")
    }
  }
}



// MARK: - IBActions
extension ViewControllerDog {

  @IBAction func add(_ sender: UIBarButtonItem) {
   // walks.append(Date())
    tableView.reloadData()
  }
}

// MARK: UITableViewDataSource
extension ViewControllerDog: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let walks = currentDog?.walks else {
      return 1
    }
    return walks.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // let date = walks[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    // cell.textLabel?.text = dateFormatter.string(from: date)
    guard let walk = currentDog?.walks?[indexPath.row] as? Walk, let walkDate = walk.date as Date? else {
      return cell
    }
    cell.textLabel?.text = dateFormatter.string(from: walkDate)
    return cell
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "List of Walks"
  }
}
