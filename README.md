# Sam's Club TV Buying Guide

## Overview

The purpose of this app is to help someone buy a new TV.

I meet the requirement of showing a list of items from the API call but I'm doing in a way that tries to answer the question:  What is something useful that could be done with this data?

It's always important to think beyond the stated requirement, in certain situations, demonstrate how to reframe problems.

In this case, what job is a person trying to get done given that, technically, I can provide them with information on new TVs.

So when someone shops for a new TV, do they want to just see a list of available TVs?  Is that how their buying process works?  Unlikely.

They probably have some questions like:
- What factors should I consider when buying a new TV?  I haven't bought one in a while.  What is 4K? What is IPS?  Do I need to know these terms?
- If I'm thinking of getting a much bigger TV, how might it look in the room I'm placing it in?
- Can I see a list of TVs sorted by the criterial important to me (once I figure out what I think is important)?
- I don't want to be overwhelmed with too many choices.  What about seeing the ones most other people buy?  Something that is a good proxy for  "safe" choice.

### Included Libraries via Pods
1. Cosomos - for star ratings views. https://github.com/evgenyneu/Cosmos
2. Kingfisher - for image downloading, caching and management. https://github.com/onevcat/Kingfisher
3. Reachability by Ashley Mills - to handle checking for a network connection and if not there redirecting the user to Settings. https://github.com/ashleymills/Reachability.swift
4. SwiftSpinner - A very nice spinner.  I use it here for to let the user know the data is still loading.  A much nicer approach than the activity indicator in iOS. https://github.com/icanzilb/SwiftSpinner
5. Ramotion Folding Cell - This allows a table cell to unfold in place.  I use it in the top rated view to further simplify the cognitive load on a user.  https://github.com/Ramotion/folding-cell

## Comments on the Main View

As I stated above (and you can see in my blog), the frame is around what job the person is trying to get done.  When buying a new TV, these four buttons, while not exhaustive, better signal to the user that we are trying to help them find a solution to the job they are trying to get done.  As part of seeking a solution, these seems like 4 reasonable things someone might want to do before buying.

* **Tom's Guide**  The assumption is that you don't buy a TV very often.  It's on your list but you likely don't know what features are important and you don't really trust the Store to tell you the straight story.  So go to external party, not affiliated with Sam's Club.  Even allow someone to buy  in this view from another vendor.  It increases credibility to the user that Sam's Club would do this.  It is somewhat similar to what Amazon did when they started letting other vendors sell the same thing they were selling.
* **See New TV in Your Room**  ARKit in action.  The iOS 11 library seems like a huge when for retail as consumers can much easier envision what the product looks like in their home setting.  You will see a small button in the lower right with a picture of a TV that says HD on it.  Tap that.  A popover will appear with a rotating tv.  Select it.  Point your phone at a well lit wall not too far away.  Tap and a TV should appear.  You  know it's working with a set of 4 controls show up on the lower left that let you delete the tv, rotate it, or move and up or down.  It's still flaky so you might try tapping the close button in the upper right and start again.  Make sure there is good lighting.  You will then see a TV in your room to get a vision of what a new one might look like.  Clearly more can be added here like a tracking rectangle so the user knows were to tap.  Better placement management.  It's a start into the world of ARKit but more importantly making it easy for a consumer to envision what a new purchase will look like in their home before they buy.  It should increase the emotional desire to buy.
* **Show New All TVs**  This is the classic list of all the TVs.  The API can retrieve over 6,600 + TVs (not all TVs as the data is not clean).  There is no search or sort.  The filter button does not work but the really app would surely have one.  The idea of this view is to show that all the data has arrived, is parsed correctly, displayed correctly and layout correctly.  Tap any cell to see the detail for that item.
* **See Top Rated TVs**  When shopping online, the user is presented with a huge list of choices.  Various properties are added to indicate preference in an effort to simplify choice.  This button goes a step further and just shows the top rated TVs.  The idea is that when I don't know what to buy, I'll just start with the top rated.  The user does not need to go to the list of everything and then run through some filter UI.  In general, the fewer taps, the better.  Note: the data that shows is not **actually** the top rated TVs.  There is no search API so I just take the first number of TVs from page 0 of the API call.  This allows the concept to be shown.  Also, the resulting table view uses. The view uses a folding cell. Taping and going to another view controller just adds a slight amount of mental load.  The purpose the the Top Rated view is to simplify and make the choice mentally easier.  Somewhat like walking down the TV isle in a Sams's Club where there are just a few TVs on display with some bullet points of features and a big stock.  It cries out: "Just pick one of these."

## Other Comments

There was a requirement to lazy load more items in the tableview.  Rather than waiting for the user to get to the end of the tableview and showing a spinner while they wait, I implemented pre-fetching the data using the iOS APIs for this, as well as using it for image pre-fetching.

In my read of the one page API documentation, it appeared that totalProducts was the total number of products available from the backend data store.  So I developed the logic to determine how many pages, at 30 items per page, would be needed to get to the end.  And then, handle the end case in the table view.  Upon testing I found that totalProducts is really the total number of pages that have products in the json.  As of this writing in September, that was 224 pages, or about 6.720 products (the last page only has 1 product so it's less).  Many of the product elements appear duplicated.  The existing app will handle the 224 pages if the logic checking is removed for the page count.  Right now it checks for 224 products across 30 products per page which require 8 pages.

## Requriements

* You need iOS 11.  This is Swift 4. You might need iPhone 6s or higher for ARkit features.
* This app includes Apple Pay.  It's best to run this on the simulator. To run it on a device you really need a test account set up in iTunes Connect and a test card from Apple.  You may need to do some configuration to run it on the simulator and the device if you get provisioning profile errors.  Try slightly changing the bundle ID on the general tab.  Then go the Capabilities tab and go down to Apple Pay. Tap the plus button to add a merchant ID.  The merchant ID starts with "merchant" which is pre-populated in the text field.  Paste in your modified bundle ID and hit ok to set up a new merchant ID.  Test the payment on the simulator.  Take that new merchent ID and change out the existing one in the Constants.swift file.
* Once you have changed the bundle ID, try signing with your provisioning profile.
* The version of this App on Github does not have the API key.  Please get your own API key and place it in Constants.swift where the blank string exists.

## Installation of Pods

Please run the Podfile to install the required CocoaPods.  Use terminal to traverse to the directory with the project.  Then,

```
 pod install
```

### Other Notes

There is always more work to do on software.  For this project, some of those things are:
* Check for brand guidelines conformance
* Write more unit and UI tests
* A lot more testing (performance, bad data, timing, etc)
* More features.
* More error checking
* Better coding ideas
* Would be nice to implement Stripe
* Need a search API then can do filtering
* Let user save some favorite TVs from the long list
* Some Sam's Club store integration
* User account
* App icon that follows brand guidelines
* More animation/motion for better experience
* Break storyboard into pieces for team work
* Data should be cleaned up on the backend
* Auto layout improvements (still a few warnings also)
* Change Top Rated view to use Apple store type design rather than folding cell
* Swipe to next and previous item in ShowAllTvsVC
* .....and more

Attributions
* TV scene kit image was purchased from Turbosquid.com
* None of the assets in here should be used in a comercial product
* Icons from icons8.com
Copyright Dave Rothschild
