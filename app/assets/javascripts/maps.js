
 $(document).ready(function()
 {
 	var mapOptions =
 	{
 			zoom: 8,
 			center: new google.maps.LatLng(43.4454345, 11.3454567),
 			mapTypeId: google.maps.MapTypeId.ROADMAP
 	};
 	var map = new google.maps.Map($('#map')[0], mapOptions);
 });
