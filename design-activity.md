What classes does each implementation include? Are the lists the same?
Each implementation have 3 classes: CartEntry, ShoppingCart, and Order.

Write down a sentence to describe each class.

Implementation A
Class CartEntry: assign the value of the variables unit_price and quantity and gives access to them from outside the class.
Class ShoppingCart: assign the value of the variable entries and gives access to it from outside.
Class Order: instantiate a new instance of ShoppingCart and calculates the total price of all the entries in the cart.

Implementation B
Class CartEntry: assign the value of the variables unit_price and quantity and calculates the price of each item according to its quantity.
Class ShoppingCart: assign the value of the variable entries and calculates the price of all the entries in the shopping cart.

Class Order: instantiate a new instance of ShoppingCart and calculates the total price of all the entries in the cart plus the sales tax using a helper method "price" from the ShoppingCart class.

How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

Implementation A:
Class CartEntry and class ShoppingCart does not relate to each other but then all 3 classes relate to class Order.
Class Order has-a ShoppingCart instance which has a collection of entries coming from class ShoppingCart. Also, class CartEntry provides to the class Order, the unit_price and quantity of each entry.

Implementation B:
The class Order has-a ShoppingCart instance that provides a collection of entries each one with its own price that is provided by a helper method price in class CartEntry.

What data does each class store? How (if at all) does this differ between the two implementations?
Implementation A:
CartEntry: values of unit_price and quantity.
ShoppingCart: collection of entries.
Order: new cart and the total price of all the entries in the cart including the taxes.   

Implementation B:
CartEntry: values of unit_price and quantity
ShoppingCart: collection of entries and the sum of the price of all the entries together.
Order: new cart and the total price of all the entries in the cart including the taxes. Also stores the constant SALES_TAX.

What methods does each class have? How (if at all) does this differ between the two implementations?

Implementation A:
Class CartEntry: constructor method
Class ShoppingCart: constructor method
Class Order: constructor method and total_price method.

Implementation B:
Class CartEntry: constructor method and price method.
Class ShoppingCart: constructor method and price method.
Class Order: constructor method and total_price method.


Consider the Order#total_price method. In each implementation:
Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?

Implementation A:
The logic for price is retained in Order.

Implementation B:
The logic for price is delegated to lower level classes like ShoppingCart and CartEntry

Does total_price directly manipulate the instance variables of other classes?
Implementation A:
Yes, the method total_price in class Order manipulates all the instance variables of the other classes.

Implementation B:
No, it does not manipulates directly the instance variables but it does indirectly as it manipulates a helper method from class ShoppingCart, and this price method does manipulate instance variables.


If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?

The price of the items depending on the quantity will change so, this will be easy to change in Implementation B at the helper method price by adding a conditional so that in case of a certain quantity the price will change.
Doing this in Implementation A will be more complicated because it will need to be changed the method total_price in the class Order by adding a conditional there.

Which implementation better adheres to the single responsibility principle?

Implementation B.

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled?

Implementation B because class CartEntry does not depend on class ShoppingCart or viceversa, and in implementation A, class Order is very dependent of the other classes.

-------------------------------

MY HOTEL PROJECT:
In my Hotel project I have 4 classes each of them with a responsibility:
Booking: to control the reservations of individual and blocked rooms.
Reservation: to calculate the cost of a reservation.
DatesRange: to validate the staying time of a guest.
BlockRooms: to calculate the total cost of a block room when available.

Overall, I think all of my classes have state and behavior. 
