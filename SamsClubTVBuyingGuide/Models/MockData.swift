//
//  MockData.swift
//  SamsClubTVBuyingGuide
//
//  Created by David Rothschild on 9/26/17.
//  Copyright © 2017 Dave Rothschild. All rights reserved.
//

import Foundation

struct Swifter: Decodable {
    let fullName: String
    let id: Int
    let twitter: URL
}

let json = """
{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
}
""".data(using: .utf8)! // our data in native (JSON) format
//let myStruct = try JSONDecoder().decode(Swifter.self, from: json) // Decoding our data
//print(myStruct) // decoded!!!!!


/*
 struct Swifter: Decodable {
 let fullName: String
 let id: Int
 let twitter: URL
 }
 
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

/*
 
 /// Sample returned JSON to use for Unit test
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
 },
 {
 "productId": "089796c9-17e4-4a7d-b37a-c86567feab39",
 "productName": "VIZIO 43\" Class 1080p LED Smart HDTV - E43-C2",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p</li>\n\t<li>Clear Action 240</li>\n\t<li>HDMI Inputs: 3</li>\n\t<li>Smart TV</li>\n</ul>\n",
 "longDescription": "<p>The all-new 2015 E-Series 43&rdquo; (43&rdquo; diag.) Full-Array LED Smart TV has arrived. Featuring a new, modern design, brilliant picture quality, and faster, easier-to-use smart TV experience, the all-new E-Series brings you premium HD entertainment at an incredible value. Built-in high-speed Wi-Fi gets you connected in a snap, and with the hottest apps to choose from like Netflix, Amazon Instant Video, iHeartRadio, Hulu Plus, Spotify, YouTube and more*. Enjoying what you want, when you want it is easier than ever before. Plus, you get brilliant picture quality using the latest advanced technologies &mdash; like Full-Array LED backlighting for superior light uniformity, and up to 5 Active LED Zones&trade; producing vivid details with deeper, more pure black levels**. For sports and action fans, E-Series includes Clear Action 240, which combines powerful image processing with 120Hz effective refresh rate for enhanced detail in fast action scenes.</p>\n\n<p><span style=\"font-size:10px;\">1High-speed/Broadband Internet service, app subscription and access equipment are required and not provided by VIZIO.&nbsp;<br />\n\ufffd\ufffd\ufffd<span font-size:=\"\" line-height:=\"\">2Compared to previous generations of VIZIO E-Series TVs.</span></span></p>\n\n<p>VIZIO E-Series: Incredible picture, unbeatable value.</p>\n",
 "price": "$378.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image9.jpeg",
 "reviewRating": 4.3333,
 "reviewCount": 9,
 "inStock": true
 },
 {
 "productId": "0afc23f3-cd0f-4deb-be5a-de74487e79a9",
 "productName": "Atlantic Single Adjustable Component Shelf For Flat Screen TV",
 "shortDescription": "<ul>\n\t<li>Supports up to 15.4 lbs</li>\n\t<li>Solid heavy-gauge steel construction with durable product coated finish</li>\n\t<li>UL Listed</li>\n\t<li>Adjustable Shelf Height</li>\n\t<li>Installation is fast and easy</li>\n</ul>\n",
 "longDescription": "The Wall Mount Adjustable Component Shelf allows you to mount your DVD player or Cable/Dish Box to the wall, saving you space. This Component shelf features heavy-gauge steel construction with durable product coated finish so you can enjoy it for years. The 6mm clear tempered glass shelf can support up to 15.4 lbs. Based on your room decor, you can fix this shelf to a desired height. Easy to install, this component wall mount shelf makes cable management quite simple with the TV and components close together.  Comes with instruction manual and mounting screws.",
 "price": "$14.86",
 "productImage": "https://walmartlabs-test.appspot.com/images/image1.jpeg",
 "reviewRating": 4.4,
 "reviewCount": 10,
 "inStock": true
 },
 {
 "productId": "0c3480d5-21f8-4422-aceb-b659d9a78b1f",
 "productName": "APC Performance SurgeArrest 11 Outlet",
 "shortDescription": "With APC SurgeArrest, you get maximum protection and convenience for computers, notebooks and\r\nother electronics.",
 "longDescription": "<div class=\"content_style\">\r\n<p><b>Lightning and Surge Protection</b><br />\r\nSurgeArrest components such as MOVs and Thermal fuse ensure instantaneous reaction to lightning strikes and wiring faults. If the surge components are damaged due to power spike or over voltage, excess power cannot reach your equipment. Unlike the APC SurgeArrest products, most surge suppressors continue to let power through even after circuits have been damaged, leaving your equipment exposed to other damaging surges. </p>\r\n\r\n<p><b>IEEE Let-Through Rating and UL 1449 Compliance</b><br />\r\nThe 'Institute of Electrical and Electronics Engineers' (IEEE) Let-Through Voltage rating is based on a test that subjects a Surge Protector to a 6,000 volt spike. The rating equates to the amount of excess voltage that reaches connected equipment. The lower the number, the better the performance of the Surge Protector is. Underwriter's Laboratory's UL1449 surge protection safety standard uses these ratings to help users gauge performance. UL's best Transient Voltage Surge Suppressor (TVSS) Let-Through Voltage rating is \"300V\".</p>\r\n\r\n<p><b>Data-line Protection</b><br />\r\nProtection of data lines (Ethernet, Coaxial and Phone lines) ensures complete protection of your equipment from surges. It is very important to protect your equipment from \ufffd\ufffd\ufffdback door\ufffd\ufffd\ufffd surges traveling through data lines, as they can be as damaging to your equipment as surges traveling over power lines. Noise Filtering Surge Protector attenuates EMI/RFI line noise that can cause data errors and keyboard lockups, ensuring better performance of protected\r\nequipment.</p></div>",
 "price": "$19.98",
 "productImage": "https://walmartlabs-test.appspot.com/images/image6.jpeg",
 "reviewRating": 4.85,
 "reviewCount": 20,
 "inStock": true
 },
 {
 "productId": "0de8bab9-d940-41b6-910c-3d555ca63247",
 "productName": "VIZIO 40\" Class 1080p LED Smart HDTV - E40-C2",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p</li>\n\t<li>Clear Action 240&nbsp;</li>\n\t<li>HDMI Inputs: 2</li>\n</ul>\n",
 "longDescription": "<p>The all-new 2015 E-Series 40&rdquo; (40&rdquo; diag.) Full-Array LED Smart TV has arrived. Featuring a new, modern design, brilliant picture quality, and faster, easier-to-use smart TV experience, the all-new E-Series brings you premium HD entertainment at an incredible value. Built-in high-speed Wi-Fi gets you connected in a snap, and with the hottest apps to choose from like Netflix, Amazon Instant Video, iHeartRadio, Hulu Plus, Spotify, YouTube and more. Enjoying what you want, when you want it is easier than ever before. Plus, you get brilliant picture quality using the latest advanced technologies &mdash; like Full-Array LED backlighting for superior light uniformity, and up to 5 Active LED Zones&trade; producing vivid details with deeper, more pure black levels2. For sports and action fans, E-Series includes Clear Action 240, which combines powerful image processing with 120Hz effective refresh rate for enhanced detail in fast action scenes.</p>\n\n<p>VIZIO E-Series: Incredible picture, unbeatable value.</p>\n",
 "price": "$338.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image7.jpeg",
 "reviewRating": 4.2,
 "reviewCount": 5,
 "inStock": true
 },
 {
 "productId": "0e56dd23-29a0-4d0e-882a-6f7d851d7ec4",
 "productName": "Knightsbridge Reclaimed Wood 58 Inch TV Stand",
 "shortDescription": "<ul style=\"font-size: 13px; line-height: 20.7999992370605px;\">\n\t<li>HFSC approved Pine framework</li>\n\t<li>Natural reclaimed teak planks</li>\n\t<li>Made from solid wood boards, no veneers or particle boards used</li>\n</ul>\n",
 "longDescription": "<p>The Knightsbridge 58&nbsp;Inch TV&nbsp;Stand is a solid wood media center with rustic appeal. Designed to accommodate most wide screen TVs, this console has a solid wood center shelf for open access to electronic components. Four generous storage drawers keep movie collections and gaming accessories in one convenient place. The unfinished salvaged teak planks have all the original marks and imperfections, giving this TV console its unique weathered appearance that will only improve with daily use and age.</p>\n",
 "price": "$1,199.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image8.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "0ff4d723-9973-4450-8f3b-f98bfb8ebd10",
 "productName": "SquareTrade 4-Year TV Protection Plan",
 "shortDescription": "<ul>\n\t<li>Protection against mechanical/electrical failures from normal use</li>\n\t<li>PLUS members receive an additional 12 months of coverage</li>\n\t<li>100% parts &amp; labor, no deductibles</li>\n\t<li>On-site service for TVs 37&rdquo; and above, free 2-way shipping for smaller TVs</li>\n\t<li>24/7 customer support</li>\n</ul>\n",
 "price": "$49.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image7.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": false
 },
 {
 "productId": "102ab638-1a62-45fe-b9ab-b01dee7d363b",
 "productName": "Granville 66\" Mocha Black Wood Veneer TV Bench",
 "shortDescription": "Beautiful brushed aluminum hardware and spacious open shelves make this extra wide design the perfect way to sit down and enjoy your flat screen TV and home entertainment system.",
 "longDescription": "Add a sleek contemporary look to your home theater display with this new extra wide TV bench from the Granville Collection. Sliding tempered glass doors framed with a Mocha Black wood veneer offer the perfect stage for up to an 80\" TV while providing the ideal space to safely conceal your components and accessories. Beautiful brushed aluminum hardware and spacious open shelves make this extra wide design the perfect way to sit down and enjoy your flat screen TV and home entertainment system. Maximize your living space with the versatility of both open and closed storage and make the ideal choice for entertainment.",
 "price": "$519.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image9.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "118bd454-ccbb-43eb-8cc2-ef99c6760135",
 "productName": "Sharp 40\" Class 1080p LED Smart HDTV - LC-40LE653U",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p&nbsp;</li>\n\t<li>Refresh Rate: 60Hz w/ AquoMotion 120</li>\n\t<li>HDMI Inputs: 2</li>\n</ul>\n",
 "longDescription": "<p>The AQUOS LC-40LE653U gives you gorgeous, reliable performance with SmartCentral&trade; Apps for smart TV access. Add to that its ultra-narrow bezel and sleek, modern design, Wallpaper Mode, two HDMI inputs including MHL and built-in 20w audio, and you&rsquo;ve got a great all-around Full HD Smart LED TV.</p>\n",
 "price": "$338.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image6.jpeg",
 "reviewRating": 5,
 "reviewCount": 1,
 "inStock": true
 },
 {
 "productId": "140d3fe2-f336-4ff5-ae4b-cd4b8b001d35",
 "productName": "Ready Set Mount Low Profile Mount Kit for 37\"-70\" TVs",
 "shortDescription": "<li> Fits 37\" to 70\" Flat Panel LCD and Plasma Visual Display Products \r\n<li> Color:  Semi-Gloss Black \r\n<li> Profile from wall with optional (included) Tilt bar: 1.5\" \r\n<li> Includes 8\ufffd\ufffd\ufffdfoot HDMI cable, screen cleaner and cloth\r\n",
 "longDescription": "Have you been searching for an ultra slim LCD/Plasma TV Mount?  Look no further as the Ready Set Mount T3770BPK is the perfect mount solution!  The T3770BPK offers a very discreet and slim line installation for your 37\ufffd\ufffd\ufffd to 70\ufffd\ufffd\ufffd LCD and/or Plasma TV, up to 165 lbs. At the same time, offers an incredible low mounting profile only 1\ufffd\ufffd\ufffd from the wall, in addition to, an optional tilt function of (-) 5\ufffd\ufffd.  Better yet, the T3770BPK is UL & GS/TUV safety certified and includes an integrated bubble guide and safety lock feature! This incredible value offering includes an 8' HDMI cable, screen cleaner and cloth to assist in your high-definition viewing!  It\ufffd\ufffd\ufffds that simple\ufffd\ufffd\ufffd Ready Set Mount!",
 "price": "$29.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image3.jpeg",
 "reviewRating": 4.1552,
 "reviewCount": 58,
 "inStock": true
 },
 {
 "productId": "1894ee65-8e61-4bbb-a48e-180d2c3f78ae",
 "productName": "Ashford 48\" TV Console",
 "shortDescription": "<p>The Ashford Media Console is perfect for today&#39;s televisions and electronics.</p>\n",
 "longDescription": "<p>Beautifully finished in dark walnut, the concole&nbsp;is engineered from tropical hardwoods, veneers and MDF.&nbsp;The Ashford has a fully finished back panel with pre-drilled holes for wire management. The front door is made from tempered glass and encloses adjustable shelves for custom design.</p>\n",
 "price": "$299.99",
 "productImage": "https://walmartlabs-test.appspot.com/images/image3.jpeg",
 "reviewRating": 3,
 "reviewCount": 2,
 "inStock": true
 },
 {
 "productId": "192282b8-151e-4033-b82f-9cd24dfd31b4",
 "productName": "Philips 2.0 Soundbar w/ Bluetooth",
 "shortDescription": "<p>Get amazing virtual surround sound from your TV via just one cable! In addition to movies, you can also enjoy top quality Music iLink MP3 playback from your mobile devices.</p>\n",
 "longDescription": "<p><b>Virtual Surround Sound</b><br />\n<br />\nPhilips Virtual Surround Sound produces rich and immersive surround sound from less than five-speaker system. Highly advanced spatial algorithms faithfully replicate the sonic characteristics that occur in an ideal 5.1-channel environment. Any high quality stereo source is transformed into true-to-life, multi-channel surround sound. No need to purchase extra speakers, wires or speaker stands to appreciate room-filling sound.</p>\n\n<p><b>Audio In</b></p>\n\n<p>Audio in allows you to easily play your music directly from your iPod/iPhone/iPad, MP3 player, or laptop via a simple connection to your Philips home cinema system. Simply connect your audio device to the Audio in jack to enjoy your music with the superior sound quality of the Philips home cinema system.</p>\n\n<p><b style=\"line-height: 1.6em;\">\ufffd\ufffd\ufffdDolby Digital</b></p>\n\n<p>Because Dolby Digital, the world&#39;s leading digital multi-channel audio standards, make use of the way the human ear naturally processes sound, you experience superb quality surround sound audio with realistic spatial cues.</p>\n",
 "price": "$79.86",
 "productImage": "https://walmartlabs-test.appspot.com/images/image3.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "1b77af02-fd2e-4011-92ef-6791371783e8",
 "productName": "Samsung Smart Blu-Ray Player",
 "shortDescription": "<ul>\n\t<li>Watch Blu-ray</li>\n\t<li>Stream movies and music</li>\n\t<li>Stay connected socially</li>\n</ul>\n",
 "longDescription": "<p>WATCH BLU-RAY&trade; AND STREAM AWAY. Stream movies on Netflix, weatherproof your day with AccuWeather&reg;, watch your favorite videos on YouTube&trade;, stay connected with Twitter and Facebook&reg;, listen to music on Pandora&reg; and much more. Expand your entertainment collection &ndash; watch Blu-ray&trade;, stream, or up-convert your favorite DVD to near Blu-ray&trade; qualit.&nbsp;</p>\n",
 "price": "$59.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image10.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "1c19777e-b3f9-46fe-a7ce-1f317dc06f5e",
 "productName": "VIZIO 48\" Class 1080p LED Smart HDTV - E48-C2",
 "shortDescription": "<ul>\n\t<li>Resolution:&nbsp;1080p</li>\n\t<li>Refresh Rate:&nbsp;120Hz<span style=\"line-height: 1.6em;\">&nbsp;w/&nbsp;</span><span style=\"font-size: 13px; line-height: 20.7999992370605px;\">Clear Action 240</span></li>\n\t<li><span style=\"line-height: 1.6em;\">HDMI Inputs: 3</span></li>\n</ul>\n",
 "longDescription": "<p>The all-new 2015 E-Series 48&rdquo; (48&rdquo; diag.) Full-Array LED Smart TV has arrived. Featuring a new, modern design, brilliant picture quality, and a faster, easier-to-use smart TV experience, the all-new E-Series brings you premium HD entertainment at an incredible value. &nbsp;Built-in high-speed Wi-Fi gets you connected in a snap, and with the hottest apps to choose from like Netflix, Amazon Instant Video, iHeartRadio, Hulu Plus, Spotify, YouTube and more<sup>1</sup>. Enjoying what you want, when you want it is easier than ever before. &nbsp;Plus, you get brilliant picture quality using the latest advanced technologies &mdash; like Full-Array LED backlighting for superior light uniformity, and up to 6 Active LED Zones&trade; producing vivid details with deeper, more pure black levels<sup>2</sup>. For sports and action fans, E-Series includes Clear Action 240, which combines powerful image processing with 120Hz effective refresh rate for enhanced detail in fast action scenes. VIZIO E-Series: Incredible picture, unbeatable value.</p>\n\n<p><span style=\"font-size:10px;\">1High-speed/Broadband Internet service, app subscription and access equipment are required and not provided by VIZIO.&nbsp;<br />\n2Compared to previous generations of VIZIO E-Series TVs.</span></p>\n",
 "price": "$448.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image9.jpeg",
 "reviewRating": 5,
 "reviewCount": 1,
 "inStock": true
 },
 {
 "productId": "1d6f39c3-f3c6-429c-b4c4-7fb257df6171",
 "productName": "VIZIO\ufffd\ufffd60\"\ufffd\ufffdClass 4k Ultra HD LED Smart TV -\ufffd\ufffdP602UI-B3",
 "shortDescription": "<ul>\n\t<li style=\"margin: 0px; padding: 0px;\">Resolution: 4K&nbsp;Ultra HD</li>\n\t<li style=\"margin: 0px; padding: 0px;\">Refresh Rate: 240Hz</li>\n\t<li style=\"margin: 0px; padding: 0px;\">HDMI Inputs: 5</li>\n</ul>\n",
 "longDescription": "<p>Engineered with the latest technologies, P-Series TVs offer incredibly rich, best-in-class picture quality. Full-Array LED backlighting and 64 Active LED Zones deliver superior light uniformity with incomparable contrast levels, and deepest, purest black levels. Active Pixel Tuning enables pixel-level brightness adjustments for increased picture accuracy and contrast. And for sports and action fans, we&rsquo;ve included up to Clear Action 960, which combines powerful image processing with a blazing 240Hz effective refresh rate for sharper detail in fast action scenes.</p>\n",
 "price": "$1,298.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image5.jpeg",
 "reviewRating": 4.2407,
 "reviewCount": 54,
 "inStock": true
 },
 {
 "productId": "1f4bf8df-d054-448d-8721-99d430860d09",
 "productName": "Samsung 32\" Class 1080p LED Smart HDTV - UN32J525DAFXZA",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p</li>\n\t<li>Refresh Rate: 60Hz</li>\n\t<li>HDMI Inputs: 2</li>\n</ul>\n",
 "longDescription": "<p>With the Samsung Smart LED TV, &ldquo;Smart&rdquo; is only the beginning. Navigate effortlessly through the Samsung Smart TV to find your favorite shows, movies, sports and games. Go beyond watching TV and check out the latest YouTube hits, entertainment news or do some online shopping with full web browsing capabilities. See it all with greater picture quality including a wider spectrum of colors with the Wide Color Enhancer. Enjoy a clear moving picture resolution at Motion Rate 60 with amazing refresh rate, processing speed and backlight technology. The screen mirroring feature allows you to mirror your mobile device onto the TVs screen wirelessly so you can use your big screen TV for showing content, media playback, or other function.</p>\n",
 "price": "$268.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image6.jpeg",
 "reviewRating": 5,
 "reviewCount": 1,
 "inStock": true
 },
 {
 "productId": "1f80e11b-1412-4990-813a-f068e1122873",
 "productName": "VIZIO 23\" Class 720p LED HDTV - E231-B1",
 "shortDescription": "<ul>\n\t<li>Resolution: 720p</li>\n\t<li>Refresh Rate: 60Hz</li>\n\t<li>HDMI Input: 1</li>\n</ul>\n",
 "longDescription": "<p>Introducing the all-new 2014 E-Series 23&rdquo; (22.95&rdquo; diag.) Razor LED TV with an ultra-narrow frame and vibrant LED-lit picture. Edge-lit Razor LED backlighting delivers brilliant picture quality in an ultra-thin design. Enjoy high definition TV in crisp, clear resolution. With a near borderless design, a thinner side profile and space-saving, slimmer base, the new E-Series 23&rdquo; Full-Array LED TV is a perfect upgrade to any room.</p>\n\n<p>VIZIO E-Series: Picture-Perfect Brilliance.</p>\n",
 "price": "$134.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image9.jpeg",
 "reviewRating": 3,
 "reviewCount": 2,
 "inStock": true
 },
 {
 "productId": "20a96aca-4602-4901-b859-a2e14f78ef2b",
 "productName": "VIZIO 60\" Class 1080p LED Smart HDTV - E60-C3",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p</li>\n\t<li>Clear Action 240</li>\n\t<li>HDMI Inputs: 3</li>\n</ul>\n\n<p>&nbsp;</p>\n",
 "longDescription": "<p>The all-new 2015 E-Series 60&rdquo; (60&rdquo; diag.) Full-Array LED Smart TV has arrived. Featuring a new, modern design, brilliant picture quality, and faster, easier-to-use smart TV experience, the all-new E-Series brings you premium HD entertainment at an incredible value. Built-in high-speed Wi-Fi gets you connected in a snap, and with the hottest apps to choose from like Netflix, Amazon Instant Video, iHeartRadio, Hulu Plus, Spotify, YouTube and more. Enjoying what you want, when you want it is easier than ever before. Plus, you get brilliant picture quality using the latest advanced technologies &mdash; like Full-Array LED backlighting for superior light uniformity, and up to 12 Active LED Zones&trade; producing vivid details with deeper, more pure black levels2. For sports and action fans, E-Series includes Clear Action 240, which combines powerful image processing with 120Hz effective refresh rate for enhanced detail in fast action scenes.</p>\n\n<p><span style=\"font-size:10px;\">1High-speed/Broadband Internet service, app subscription and access equipment are required and not provided by VIZIO.&nbsp;<br />\n\ufffd\ufffd\ufffd<span font-size:=\"\" line-height:=\"\">2Compared to previous generations of VIZIO E-Series TVs.</span></span></p>\n\n<p>VIZIO E-Series: Incredible picture, unbeatable value.</p>\n",
 "price": "$748.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image2.jpeg",
 "reviewRating": 4.5,
 "reviewCount": 2,
 "inStock": true
 },
 {
 "productId": "218ca04a-0a9f-42b3-9fa5-1ca592fc7d29",
 "productName": "LG 32\" Class 720P LED HDTV - 32LF500B",
 "shortDescription": "<ul>\n\t<li>Resolution: 720p</li>\n\t<li>Refresh Rate: 60Hz</li>\n\t<li>HDMI Inputs: 3</li>\n</ul>\n",
 "longDescription": "<p><b>LED</b><br />\n\ufffd\ufffd\ufffdLED uses tiny, energy-efficient light-emitting diodes to illuminate the picture. The new standard in HDTVs, LED is superior to older CCFL technology, making slimmer televisions possible, with amazing brightness, clarity and color detail.</p>\n\n<p><span style=\"line-height: 1.6em;\"><b>Triple XD Engine</b><br />\nLG&rsquo;s exceptional picture quality is further enhanced by the Triple XD Engine, which processes images with even greater precision. The latest Triple XD Engine enables more natural color expression, deeper contrast and more refined motion so that viewers can enjoy a more lifelike picture.</span></p>\n\n<p><span style=\"line-height: 1.6em;\"><b>Smart Energy Saving<br />\n\ufffd\ufffd\ufffd</b></span><span style=\"line-height: 1.6em;\">This valuable feature includes a backlight control to adjust the brightness, a screen-off function that turns the screen off to play audio only, and the Standby Mode Zero function that allows the TV to effectively hibernate, using zero electricity.</span></p>\n",
 "price": "$217.88",
 "productImage": "https://walmartlabs-test.appspot.com/images/image5.jpeg",
 "reviewRating": 4.8125,
 "reviewCount": 16,
 "inStock": true
 },
 {
 "productId": "23a5ef6d-e583-41a6-ade8-54b9d78c8751",
 "productName": "Ready Set Mount Full Motion Mount Kit for 13\"-37\" TVs, extends 10.87\"",
 "shortDescription": "<li> Fits 13\" to 37\" LCD Flat Screen\r\n<li>Color: Semi Gloss Black\r\n<li>360\ufffd\ufffd Rotating/Pivotal Head\r\n<li>Includes 8\ufffd\ufffd\ufffdHDMI Cable, Screen Cleaner & Cloth\r\n",
 "longDescription": "The new R28BPK is the ultimate mounting solution for your 13\" To 37\" LCD Flat Panel TV and/or computer monitor. The stylish and durable cast alloy/steel design offers a 360\ufffd\ufffd rotating head with adjustable tilt, 180\ufffd\ufffd swivel/pan and an articulating arm with extension capabilities up to 10.87\" from the wall. Better yet, the R28BPK is UL and GS/TUV safety certified. The integrated bubble level guide and enhanced cable management system offer further installation ease and convenience in meeting today's market demands! This incredible value offering includes an 8' HDMI cable ($29.99 value), screen cleaner and cloth to assist in your high-definition viewing!  It\ufffd\ufffd\ufffds that simple\ufffd\ufffd\ufffd Ready Set Mount!",
 "price": "$49.86",
 "productImage": "https://walmartlabs-test.appspot.com/images/image7.jpeg",
 "reviewRating": 4.4,
 "reviewCount": 5,
 "inStock": true
 },
 {
 "productId": "23f7ff8e-5fa9-47ab-aa8d-41882aa43ccf",
 "productName": "Sherwood 70-Watt A/V Receiver with HDMI Switching",
 "longDescription": "<p>Today&#39;s multi-component home theater systems must excel at working with components including DVD and CD players, cassette decks, VCRs, and satellite or cable inputs-- not to mention radio programming. Sherwoods&#39;s A/V receivers are star performers, easily switching between inputs and encoding formats to produce brilliant, accurate sound.</p>\n",
 "price": "$149.86",
 "productImage": "https://walmartlabs-test.appspot.com/images/image8.jpeg",
 "reviewRating": 5,
 "reviewCount": 1,
 "inStock": true
 },
 {
 "productId": "240b3848-c12b-4b0d-b5b9-1b42b85d09cc",
 "productName": "Logitech Harmony 650 Remote",
 "shortDescription": "<ul>\n\t<li>Support for 8 devices is enabled at software setup</li>\n\t<li>Replaces up to 8 remotes, reducing complexity and clutter in your living room</li>\n\t<li>Bright color screen shows your channel favorite icons plus commands for easy navigation</li>\n\t<li>One-touch Activity buttons, like &quot;Watch a DVD,&quot;&nbsp;automatically switch the right devices to the right settings</li>\n\t<li>Compatible with 225,000+ devices from 5000+ brands, including devices you own today and add tomorrow</li>\n</ul>\n",
 "longDescription": "<p>One touch changes everything&mdash;with bright and brilliant control.&nbsp;Say goodbye to juggling remotes and complicated equipment settings. With a bright color screen, one-click activity buttons&nbsp;and control of 5 devices, Harmony 650 lets you access TV, movies and music effortlessly&mdash;even in the dark.</p>\n",
 "price": "$59.99",
 "productImage": "https://walmartlabs-test.appspot.com/images/image1.jpeg",
 "reviewRating": 3.3333,
 "reviewCount": 9,
 "inStock": true
 },
 {
 "productId": "25375f53-2c23-4726-8a8b-b0aa10851b67",
 "productName": "Google Chromecast Streaming Media Player with $10 Google Play Credit",
 "shortDescription": "<p>Chromecast is the easy way to enjoy online video and music on your TV. Plug it into any HDTV and control it with your existing Android smartphone or tablet, iPhone, iPad, or laptop. No remotes required. Cast your favorites from many popular apps &mdash; Netflix, YouTube, HBO GO, Hulu Plus, Pandora, Crackle, Rdio, MLB.TV, ESPN, MLS, Crunchyroll, Google Play Movies &amp; TV, Google Play Music, Google Photos, and Chrome* &mdash; to your TV with the press of a button.</p>\n",
 "longDescription": "<p><b style=\"line-height: 1.6em;\">Everything you love, now on your TV</b><br />\n<span style=\"line-height: 1.6em;\">Chromecast works with a growing number of apps, including Netflix, HBO GO, YouTube, WatchESPN &amp; Pandora. Find your favorite apps and discover more at chromecast.com/apps.</span></p>\n\n<p>For everything else, you can mirror what you see on the small screen to the big screen. If you&#39;re on your laptop, you can cast any website in Chrome; and from your Android phone or tablet, you can mirror your screen to the TV.<br />\n<br />\n<b>A whole new way to TV</b><br />\nWith Chromecast, your phone is your personalized remote control. Use the apps you know and love on your phone to search and browse, play, pause, rewind, control the volume and even make playlists. While casting, you&#39;re free to use your phone for other things.<br />\n<br />\nYour friends and family can cast to the TV using their own phone or tablet, too - with no additional set-up required. Everyone can sit back and enjoy together on the biggest screen in the home.<br />\n<br />\nWhen you&#39;re not casting, you can turn your TV screen into a beautiful backdrop filled with artwork, personal photos, satellite imagery and more. Learn how to set up this feature at chromecast.com/backdrop.<br />\n<br />\n<b>For everyone</b><br />\nIt&#39;s easy for everyone to enjoy Chromecast. It works with the devices you already own including smartphones, tablets and laptops. Plus, it automatically updates with new features and we&#39;re adding more apps all the time, so your Chromecast keeps getting better. It takes only a few minutes to set up, and at $35, it&#39;s affordable to get one for every TV in the house.<br />\n<br />\n<b>Plug in and play</b><br />\nGet started in 3 easy steps: Plug Chromecast into your TV, connect it to Wi-Fi, then cast videos and more from your smartphone, tablet, or laptop to your TV.</p>\n",
 "price": "$34.86",
 "productImage": "https://walmartlabs-test.appspot.com/images/image9.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "254294a0-8b62-4f59-8dd9-e0451bebd9d1",
 "productName": "TCL 40\" Class 1080p LED HDTV - 40FD2700",
 "shortDescription": "<ul>\n\t<li>Resolution: 1080p</li>\n\t<li>Refresh Rate: 60Hz</li>\n\t<li>HDMI Inputs: 2</li>\n</ul>\n",
 "longDescription": "<p>Enjoy The Creative Life with the TCL 40&rdquo; 1080p direct LED HDTV. It delivers premium picture quality and tremendous value in a sophisticated slim frame design perfect for bringing entertainment to any space. This flat screen LED HDTV features Full High Definition 1080p resolution for a sharper image, a 5,000,000:1 dynamic contrast ratio, and TCL True Color Technology for brilliant color and contrast. With direct LED backlighting, view darker blacks and luminous brightness while maintaining the best standards in energy efficiency.<br />\n<br />\nTwo HDMI inputs allow you to connect to satellite or cable TV, DVD/Blu-ray player, and gaming console or other device. Whether wall mounted like a piece of art or sitting on modern quad pedestal design, this TV is a sleek addition to any room. Color Your World with affordable technology.</p>\n\n<p><b>The Creative Life&nbsp;</b><br />\nAllow us to introduce ourselves. We&#39;re TCL, The Creative Life. We&#39;re one of the three largest television manufacturers in the world, selling premium consumer electronics in over 130 countries across 6 continents. And we&#39;ve been making high quality CRT, plasma and LCD televisions for over three decades. In fact, we probably made many of the components in your old TV, so even though we may have never officially met, chances are, we&#39;ve been in your home for years. So, it&#39;s nice to meet you. Again.&nbsp;</p>\n\n<p><b>The Ultimate Viewing Experience&nbsp;</b><br />\nEnjoy The Creative Life with the TCL 40&rdquo; 1080p back-lit LED HDTV. It delivers premium picture quality and tremendous value in a sophisticated slim frame design perfect for bringing entertainment to any space. This flat screen LED HDTV features Full High Definition 1080p resolution and a 5,000,000:1 dynamic contrast ratio for brilliant color and contrast.&nbsp;</p>\n\n<p><b>Modern, Efficient Design&nbsp;</b><br />\nUltra-Thin Frame Design The thin frame design of TCL&#39;s TVs gives it high-end appearance without the high-end price. Thin frames maximize the big screen experience, by letting you fit more screen into less space. And images seem bigger without the frame getting in the way.&nbsp;</p>\n\n<p><b>Save Money, Energy and the Environment&nbsp;</b><br />\nAll TCL LED TVs are Energy Star compliant. That means they not only meet energy efficiency standards established by the U.S. Environmental Protection Agency but they save you money. And all TCL LED TVs are both lead and mercury free. Which means TCL LED TVs help consumers save money--and the environment--by efficiently using energy, reducing greenhouse gas emissions and keeping harmful pollutants out of landfills.&nbsp;</p>\n",
 "price": "$288.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image3.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "261a34ec-31fb-4762-9813-860bfd14985e",
 "productName": "Samsung 65\" Class 4K Ultra HD LED Smart TV - UN65JU650DFXZA ",
 "shortDescription": "<ul>\n\t<li>Resolution: 4K Ultra HD</li>\n\t<li>Refresh Rate: 60Hz w/ 120 Clear Motion Rate</li>\n\t<li>HDMI Inputs: 4</li>\n</ul>\n",
 "longDescription": "<p>With 4K UHD resolution, you&rsquo;ll enjoy a picture with 4X the detail of Full HD. Watch and play your way with the advanced Samsung Smart TV platform that lets you quickly and easily access your favorite content. Upgrade all lower-resolution media to a stunning near ultra high-definition experience with enhanced detail and optimized picture quality. Experience UHD picture quality with deeper blacks, purer whites, brighter colors, and enhanced detail in every image. Enjoy improved fast-action moving picture resolution at Motion Rate 120 with outstanding refresh rate, processing speed and backlight technology. The screen mirroring feature allows you to mirror your phone or other compatible mobile device&rsquo;s screen onto the TVs screen wirelessly instead of your devices smaller screen for showing content, media playback, or other function. Have your Samsung Smart TV act as an alarm when synchronized with your other Samsung mobile devices. Use the large screen to display important items such as the time, weather, and your daily schedule.</p>\n",
 "price": "$1,978.00",
 "productImage": "https://walmartlabs-test.appspot.com/images/image7.jpeg",
 "reviewRating": 0,
 "reviewCount": 0,
 "inStock": true
 },
 {
 "productId": "2822c143-9322-4f0c-bea3-1fedd15af665",
 "productName": "OmniMount Full Motion Mount for 19\ufffd\ufffd\ufffd-42\ufffd\ufffd\ufffd TVs",
 "shortDescription": "<p>Designed with enhanced flexibility and affordability in mind, this full motion mount is ideal for a wide range of TVs, including 3D and LED TVs.</p>\n",
 "longDescription": "<p>Designed with enhanced flexibility and affordability in mind, the SCFM60 is a full motion mount ideal for a wide range of TVs, including 3D and LED TVs. The OmniBasics Series offers adaptability and a streamlined look at an affordable price &ndash; perfect for consumers looking for sensible mounting solutions.</p>\n",
 "price": "$59.98",
 "productImage": "https://walmartlabs-test.appspot.com/images/image4.jpeg",
 "reviewRating": 4.8333,
 "reviewCount": 6,
 "inStock": true
 }
 ],
 "totalProducts": 224,
 "pageNumber": 1,
 "pageSize": 30,
 "status": 200,
 "kind": "walmart#resourcesItem",
 "etag": "\"YInXzt8HJdoVuUAZP-9wex9eVII/xGQXPOwvLJxl22kAr7KzItCAkRY\""
 }
 */

