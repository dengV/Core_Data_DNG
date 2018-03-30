# Core_Data_DNG


学习 Core Data








<hr>



<hr>


<ul>

<li>
NSManagedObjectModel

</li>

<li>
NSPersistentStore

</li>

<li>
NSPersistentStoreCoordinator

</li>

<li>
NSManagedObjectContext

<table>
<tr>
<th>
inverse relationship handling

</th>

</tr>

</table>

</li>

<li>
NSPersistentContainer

</li>
</ul>

<hr>





## Notes One:


> // MARK: - Properties
> var managedContext: NSManagedObjectContext!


To reiterate, before you can do anything in Core Data, you first have to get an NSManagedObjectContext to work with. Knowing how to propagate a managed object context to different parts of your app is an important aspect of Core Data programming.

<hr>

## Notes Two: 

### Visualizing , Chapter 3

The graph editor style is a great tool to visualize the relationships between your Core Data entities. Here the to-many relationship from Dog to Walk is represented with a double arrow. Walk points back to Dog with a single arrow, indicating a to-one relationship.
Feel free to switch back and forth between the two editor styles. You might find it easier to use the table style to add and remove entities and attributes, and the graph style to see the big picture of your data model.

<hr>


## Notes Three:


> As you can see, the Core Data version of this method is much more complicated. First, you have to create a new Walk entity and set its date attribute to now. Next, you have to insert this walk into the currently selected dog’s list of walks.

> However, the walks attribute is of type NSOrderedSet. NSOrderedSet is immutable, so you first have to create a mutable copy (NSMutableOrderedSet), insert the new walk and then reset an immutable copy of this mutable ordered set back on the dog.

> Note: Is adding a new object into a to-many relationship making your head spin? Many people can sympathize, which is why Dog+CoreDataProperties contains generated accessors to the walks ordered set that will handle all of this for you.

> For example, you can replace the entire if-let statement in the last code snippet with the following:
> currentDog?.addToWalks(walk)

> Give it a try!




<hr>


### Convert


> /* if let dog = currentDog, let walks = dog.walks?.mutableCopy() as?    NSMutableOrderedSet {

> **            walks.add( walk)

> **          dog.walks = walks

> **                do{

> **                   try managedContext.save()

> **                }catch let error as NSError{

> **                    print("Save error: \(error), description: \(error.userInfo)")

> **                }

> }*/



### to


> currentDog?.addToWalks(walk)

> tableView.reloadData()

## 代码简化的， 丧心病狂， Core Data




<hr>



<hr>





## Git 操作 :

> git push git@dengV:dengV/Core_Data_DNG.git
