# Sam's Club TV Buying Guide - app by Dave Rothschild:

## Overview

The purpose of this app is to help someone buy a new TV.

I meet the requirement of showing a list of items from the API call but I'm doing in a way that trys to answer the question:  What is something useful that could be done with this data?

It's always important to think beyond the stated requirement, in certain situations, to demostrate how to reframe problems.

In this case, what job is a person trying to get done given that, technically, I can provide them with information on new TVs.

So when someone shops for a new TV, do they want to just see a list of available TVs?  Is that how their buying process works?  Unlikely.

They probably have some questions like:
- What factors should I consider when buying a new TV?  I haven't bought one in a while.  What is 4K? What is IPS?  Do I need to know these terms?
- If I'm thinking of getting a much bigger TV, how might it look in the room I'm placing it in?
- Can I see a list of TVs sorted by the criterial important to me (once I figure out what I think is important)?
- I don't want to be overwhelmed with too many choices.  What about seeing the ones most other people buy?  Something that is a good proxy for  "safe" choice.

### Included Libraries via Pods
1. Cosomos - for star ratings views
2. Kingfisher - for image downloading, caching and management
3. Reachability by Ashley Mills - to handle checking for a network connection and if not there redirecting the user to Settings
