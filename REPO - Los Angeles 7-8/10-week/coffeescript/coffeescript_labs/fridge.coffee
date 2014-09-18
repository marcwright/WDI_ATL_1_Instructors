￼class SelectFlights
  		constructor: (@fetchingFlights=null) ->
    		$("#tabs ul li a").bind
        		click: @changeTab
    		$("#tabs #error a").click (event) =>
      			event.preventDefault()
      			@showFlights $("#tabs li a.active").attr("href")
  		showFlights : (activeDiv) ->
  		changeTab : (event) =>
