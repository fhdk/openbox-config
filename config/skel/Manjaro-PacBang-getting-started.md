# Manjaro PacBang

## Elementary
### Changing preferences
All settings can be found in the desktop root menu **Preferences**.

### Available keybinds
To list all keybinds open the desktop menu and navigate to **Keybinds**.

### Help and Info
All kinds of help and info are available from the desktop menu **Help and Info**

### Dynamic desktop menu
Manjaro PacBang is using a static root menu including a dynamic Application menu. Should you prefer you can switch to a dynamic menu using the **Switch Menu** item.

## Network address display
Conky and Polybar needs information of your network interfaces if you want the IP address displayed.

### Conky
Conky can be controlled using the **Conky Chooser** from the **Preferences** menu.

Conky files is the new lua format and placed in your home's **.config/conky** folder.

To make your IP address appear in the conky you need to set the correct interface names. 

    nmcli | grep -e en -e wl

Then insert the interface names in the **template1** and **template2** and save the file

    -- ethernet
        template1 = 'eno1',
    -- wireless
        template2 = '',

### Polybar
Edit the file `~/.config/polybar/master.conf` and insert the interface names and save file

    ;=====================================================
    ;     Network interfaces
    ;=====================================================
    ; use nmcli to list your devices - restart polybar
    ; nmcli | grep -e en -e wl
    [nic]
    lan = eno1
    wlan = wlp3s0

## Conky Weather info

To change the displayed weather location edit the conky config and change the **template0** to print the desired text

    -- location
        template0 = 'LINUX AARHUS',

To actual display your locations weather info - open the [AccuWeather.com][1] webpage and locate your city.

When you have your city's weather forecast in your browser - goto the source of the page and locate the javascript variable named

    var currentLocation =

This variable hold the data needed for the rss link - which is parsed by acc_rss script. The below codeblock is the datastructure for the city of Aarhus in Denmark.

	var currentLocation = {
		"administrativeArea":{
			"englishName":"Central Jutland",
			"id":"82",
			"localizedName":"Midtjylland"
		},
		"country":{
			"englishName":"Denmark",
			"id":"DK",
			"localizedName":"Danmark"
		},
		"englishName":"Aarhus",
		"gmtOffset":1.0,
		"timeZoneCode":"CET",
		"hasAlerts":true,
		"hasForecastConfidence":true,
		"hasMinuteCast":true,
		"hasRadar":true,
		"key":"124594",
		"lat":56.155,
		"localizedName":"Aarhus",
		"lon":10.173,
		"primaryPostalCode":"",
		"region":{
			"englishName":"Europe",
			"id":"EUR",
			"localizedName":"Europa"
		},
		"timeZone":"CET"
	};


From the datastructure you need following values

    currentLocation.region.id = EUR
    currentLocation.country.id = DK
    currentLocation.key = 124594
    currentLocation.localizedName = AARHUS


Edit the file `~/.config/conky/accu_weather/acc_rss` and insert the values from the data structre

	# PUT YOUR LOCATIONS PARAMETERS IN THE VARIABLES BELOW
	REGION_ID="EUR"
	COUNTRY_ID="DK"
	LOCATION_KEY="124594"
	LOCALIZED_NAME="AARHUS"


[1]: https://www.accuweather.com
