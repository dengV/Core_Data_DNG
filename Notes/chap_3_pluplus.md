## The managed object context


On a day-to-day basis, you’ll work with NSManagedObjectContext the most out of the four stack components. You’ll probably only see the other three components when you need to do something more advanced with Core Data.


Since working with NSManagedObjectContext is so common, understanding how contexts work is very important! Here are some things you may have already picked up from the book so far:


* A context is an in-memory scratchpad for working with your managed objects.

* You do all of the work with your Core Data objects within a managed object context.

* Any changes you make won’t affect the underlying data on disk until you call save() on the context.



Now here are five things about contexts not mentioned before. A few of them are very important for later chapters, so pay close attention:


<hr>

<hr>


<ul>
<li>
The context manages the lifecycle of the objects it creates or fetches. This lifecycle management includes powerful features such as faulting, inverse relationship handling and validation.
</li>
<li>
A managed object cannot exist without an associated context. In fact, a managed object and its context are so tightly coupled that every managed object keeps a reference to its context, which can be accessed like so:

</li>
<code>
let managedContext = employee.managedObjectContext
</code>

<li>
Contexts are very territorial; once a managed object has associated with a particular context, it will remain associated with the same context for the duration of its lifecycle.

</li>

<li>
An application can use more than one context — most non-trivial Core Data applications fall into this category. Since a context is an in-memory scratch pad for what’s on disk, you can actually load the same Core Data object onto two different contexts simultaneously.


</li>
<li>
A context is not thread-safe. The same goes for a managed object — you can only interact with contexts and managed objects on the same thread in which they were created.”
</li>

</ul>