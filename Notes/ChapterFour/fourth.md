
> “Note: When should you store fetch requests in your data model?
If you know you’ll be making the same fetch over and over in different parts of your app, you can use this feature to save you from writing the same code multiple times. A drawback of stored fetch requests is that there is no way to specify a sort order for the results. Therefore, the list of venues you saw may have been in a different order than in the book.”




<hr>

<hr>

<hr>




If this is the case, you’ve been underestimating this class. <b> NSFetchRequest is the multi- function Swiss army knife of the Core Data framework! </b>


You can use it to fetch individual values, compute statistics on your data such as the average, minimum, maximum, and more.


How is this possible, you ask? NSFetchRequest has a property named resultType. So far, you’ve only used the default value, .managedObjectResultType. Here are all the possible values for a fetch request’s resultType:


• .managedObjectResultType: Returns managed objects (default value).


• .countResultType: Returns the count of the objects matching the fetch request.


• .dictionaryResultType: This is a catch-all return type for returning the results of different calculations.


• .managedObjectIDResultType: Returns unique identifiers instead of full-fledged managed objects.




<hr>

<hr>





> “Note: NSPredicate supports string-based key paths. This is why you can drill down from the Venue entity into the PriceInfo entity using priceInfo.priceCategory, and use the #keyPath keyword to get safe, compile-time checked values for the key path.
As of this writing, NSPredicate does not support Swift 4 style key paths such as \Venue.priceInfo.priceCategory.”


