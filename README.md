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



<hr>





## Git 操作 :

git push git@dengV:dengV/Core_Data_DNG.git
