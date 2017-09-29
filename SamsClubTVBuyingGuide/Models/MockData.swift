//
//  MockData.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

/*
 let json = """
 [{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
 },{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
 },{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
 }]
 """.data(using: .utf8)! // our data in native format
 let myStructArray = try JSONDecoder().decode([Swifter].self, from: json)
 
 myStructArray.forEach { print($0) } // decoded!!!!!
 
 */


 
 /// Sample returned JSON to use for Unit test
 let topRatedJson = """
 {
     "id": "e13ad87c-0fcf-4eaf-b779-36220288b4df",
     "products": [
         {
             "productId": "0150f9b5-8918-4fd1-92b3-fc032cc6c684",
             "productName": "Samsung 50\" Class 4K Ultra HD LED Smart TV - UN50JU650DFXZA",
             "shortDescription": "<ul>\n\t<li>Resolution: 4K Ultra HD&nbsp;</li>\n\t<li>Refresh Rate: 60Hz w/ 120 Clear Motion Rate</li>\n\t<li>HDMI Inputs: 4</li>\n</ul>\n",
             "longDescription": "<p>With 4K UHD resolution you&rsquo;ll enjoy a picture with 4X the detail of Full HD. Watch and play your way with the advanced Samsung Smart TV platform that lets you quickly and easily access your favorite content. Upgrade all lower resolution media to a stunning near ultra high-definition experience with enhanced detail and optimized picture quality. Experience UHD picture quality with deeper blacks, purer whites, brighter colors, and enhanced detail in every image. Enjoy improved fast-action moving picture resolution at Motion Rate 120 with outstanding refresh rate, processing speed and backlight technology. The screen mirroring feature allows you to mirror your phone or other compatible mobile device&rsquo;s screen onto the TVs screen wirelessly instead of your devices smaller screen for showing content, media playback, or other function. Have your Samsung Smart TV act as an alarm when synchronized with your other Samsung mobile devices. Use the large screen to display important items such as the time, weather, and your daily schedule.</p>\n",
             "price": "$928.00",
             "productImage": "https://walmartlabs-test.appspot.com/images/image5.jpeg",
             "reviewRating": 4.5,
             "reviewCount": 2,
             "inStock": true
             },
             {
             "productId": "039791fd-6478-4ca7-82de-3edd1fc8cb8d",
             "productName": "Hitachi 43\" Class 1080p LED HDTV - LE43A509",
             "shortDescription": "<ul>\n\t<li>Resolution:&nbsp;1080</li>\n\t<li>Refresh Rate: 120Hz&nbsp;</li>\n\t<li>HDMI Inputs: 3</li>\n</ul>\n",
             "longDescription": "<p><span style=\"font-size: 13px; line-height: 20.7999992370605px;\">Hitachi&#39;s new Alpha Series delivers a tremendous viewing experience at an affordable price. With a beautiful gloss black bezel, FullHD 1080p resolution and a high efficiency LED backlight, the Alpha Series gives you all the features you expect from Hitachi at prices that respond to today&#39;s demand for luxury and value.</span></p>\n",
             "price": "$329.00",
             "productImage": "https://walmartlabs-test.appspot.com/images/image6.jpeg",
             "reviewRating": 5,
             "reviewCount": 1,
             "inStock": true
         },
         {
             "productId": "0412c77e-204e-47f0-a7ff-27f4aba3416b",
             "productName": "TiVo Roamio Pro",
             "longDescription": "<p><b>The only DVR that will sweep you off your couch. </b><br />\nTiVo Roamio&trade; Pro gives you the power to watch any show, anywhere, anytime. Stream live or recorded shows directly to your iPad&reg; or iPhone&reg; around the house, or around the world. You can even download your shows and take them to go. Plus, you no longer need to switch inputs to access all the cool stuff happening on the web. The Roamio Pro serves up TV and streaming apps from a single menu, with one remote. Built with the one-of-a-kind features that make TiVo users passionately loyal, the powerful Roamio Pro records six shows at once and up to 450 hours of HD programming.</p>\n\n<p style=\"font-size: 12.727272033691406px;\"><b>What you need to Get Started</b></p>\n\n<ul style=\"font-size: 12.727272033691406px;\">\n\t<li>Subscription to the TiVo service via broadband connection</li>\n\t<li>Cable TV service, Verizon FiOS (Does not support satellite, AT&amp;T U-verse or antenna)</li>\n\t<li>One Multistream CableCARD decoder from your cable company</li>\n</ul>\n\n<p style=\"font-size: 12.727272033691406px;\"><br />\n<b>Included in Box:</b></p>\n\n<ul style=\"font-size: 12.727272033691406px;\">\n\t<li>TiVo Roamio Pro</li>\n\t<li>TiVo Roamio remote</li>\n\t<li>Quick-start guide</li>\n\t<li>Power cord</li>\n</ul>\n\n<p style=\"font-size: 12.727272033691406px;\"><br />\n<b>Optional Accessories:</b></p>\n\n<ul style=\"font-size: 12.727272033691406px;\">\n\t<li>TiVo Mini</li>\n\t<li>eSATA external drive</li>\n</ul>\n",
             "price": "$448.00",
             "productImage": "https://walmartlabs-test.appspot.com/images/image5.jpeg",
             "reviewRating": 5,
             "reviewCount": 1,
             "inStock": true
         },
         {
             "productId": "04721d49-835e-40d7-aabb-03f9c02fe173",
             "productName": "Sharp 43\" Class 1080p LED Smart HDTV - LC-43LE653U",
             "shortDescription": "<ul>\n\t<li>Resolution: 1080p&nbsp;</li>\n\t<li>Refresh Rate: 60Hz w/ AquoMotion 120</li>\n\t<li>HDMI Inputs: 3</li>\n</ul>\n",
             "longDescription": "<p>The AQUOS LC-43LE653U gives you gorgeous, reliable Smart TV performance with technologies like AquoMotion&trade; 120 for smooth motion and reduced blur and SmartCentral&trade; Apps for smart TV access. Add to that its ultra-narrow bezel and sleek modern design, Wallpaper mode, three HDMI inputs including MHL, and built-in 20w audio, and you&rsquo;ve got a great all-around Full HD LED Smart TV.</p>\n",
             "price": "$368.00",
             "productImage": "https://walmartlabs-test.appspot.com/images/image8.jpeg",
             "reviewRating": 1,
             "reviewCount": 1,
             "inStock": true
         },
         {
             "productId": "0854ee63-fcb7-43cd-9862-e4eb37004235",
             "productName": "38\" VIZIO 5.1 Soundbar w/ Wireless Subwoofer",
             "shortDescription": "<ul>\n\t<li>Sound Pressure Level: 100&nbsp;dB</li>\n\t<li>Soundbar&nbsp;Frequency: 60&nbsp;Hz - 19&nbsp;kHz</li>\n\t<li>Subwoofer Frequency:&nbsp;<span style=\"font-size: 13px; line-height: 20.7999992370605px;\">60&nbsp;</span><span style=\"font-size: 13px; line-height: 20.7999992370605px;\">Hz - 90&nbsp;</span><span style=\"font-size: 13px; line-height: 20.7999992370605px;\">Hz</span></li>\n\t<li>Bluetooth</li>\n</ul>\n",
             "longDescription": "<p>Surround yourself with amazing sound with VIZIO&rsquo;s all-new 38&rdquo; 5.1 Sound Bar System, a great fit for 42&rdquo;+ Class TVs. The addition of the rear satellite speakers and wireless subwoofer creates a true 5.1 surround sound experience, immersing you in the middle of the action. Built-in Bluetooth&reg; allows you to wirelessly stream audio from your mobile devices.</p>\n\n<p>&nbsp;</p>\n",
             "price": "$238.88",
             "productImage": "https://walmartlabs-test.appspot.com/images/image1.jpeg",
             "reviewRating": 5,
             "reviewCount": 2,
             "inStock": true
         }
}
""".data(using: .utf8)!

