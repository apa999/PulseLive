PulseLive – Demonstration App

Functionality

Document list
On launch the app will automatically download a list of documents from the server. The documents will be displayed in a list comprised of the article title and its subtitle. A “disclosure arrow” is displayed on each row to indicate to the user that the rows can be tapped to reveal the document detail.

The article list can be sorted alphabetically, ascending, or descending, by tapping the “sort” (triangle) icon in the top right of the screen. Articles will be sorted by their title. 

Although the initial retrieval of documents is automatic, the user can repeat the download whenever required by pressing the “refresh” (circular arrow) icon in the top left of the screen.

The user can filter the articles in the list by typing a filter string in the “Filter by” box immediately below the “Articles” title. The filter can be removed by tapping the “Cancel” button, or by clearing the filter box. 

Document detail
The article details are displayed when the user taps an article in the article list. This will display the article title, subtitle, text body, date and finally the article reference. Optionally, the user can add the article to the list of favourites by tapping the “Add” {+) icon in the right of the screen. The app will display a confirmation box confirming that the article has been added to the favourite’s list.

The user can navigate to either the article list, or the favourite’s list by tapping the appropriate tab icon at the foot of the screen. The user can also return to the article list by tapping the “< Articles” button in the top left of the screen.

Favourites
The user can access the favourite’s list by tapping the “Favourites” (heart) tab at the foot of the screen. This will then display the saved favourite articles, if any. The user can see the article details by tapping an article in the list of favourites. 

The favourite’s list can be sorted and filtered in the same way as the article list.

The user can delete an article from the favourites by swiping left in the favourite’s list. 


Technical

The app has been written in Swift 5.7 and uses UIKit (not SwiftUI). 

The target environment is iOS 16.4, and the app is restricted to iPhones in portrait mode.

Screens have been built manually, without using storyboards. All constraints have been added programmatically.

The app uses the standard MVC architecture; it consists of a model (for articles and details), custom components for the views, and controllers. 

The data is retrieved by the network manager, using asynchronous commands. The network manager broadcasts notifications when data is available, and the controllers observe the notifications and respond accordingly.

Some automated testing has been but most testing has been manual.
