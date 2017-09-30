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

## Comments



## Requriements

This app includes Apple Pay.  It's best to run this on the simulator.  You may need to do some configuration to run it on the simulator and the device if you get provisioning profile errors.  Try slightly changing the bundle ID on the general tab.  Then go the Capabilities tab and go down to Apple Pay. Tap the plus button to add a merchant ID.  The merchant ID starts with "merchant" which is pre-populated in the text field.  Paste in your modified bundle ID and hit ok to set up a new merchant ID.  Test payment on the simulator.

## Installation of Pods

Please run the Podfile to install the required CocoaPods.  Use terminal to traverse to the directory with the project.  Then,

```
 pod install
```

Copyright Dave Rothschild
