import 'package:google_maps_flutter/google_maps_flutter.dart';

final Set<Marker> markers = {
  Marker(
    markerId: const MarkerId("Old Trafford"),
    position: const LatLng(53.4631, -2.2913),
    infoWindow: const InfoWindow(
      title: "Manchester United - Old Trafford",
      snippet: "Home of Manchester United FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Etihad Stadium"),
    position: const LatLng(53.4831, -2.2004),
    infoWindow: const InfoWindow(
      title: "Manchester City - Etihad Stadium",
      snippet: "Home of Manchester City FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  ),
  Marker(
    markerId: const MarkerId("Anfield"),
    position: const LatLng(53.4308, -2.9608),
    infoWindow: const InfoWindow(
      title: "Liverpool - Anfield",
      snippet: "Home of Liverpool FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Stamford Bridge"),
    position: const LatLng(51.4816, -0.1910),
    infoWindow: const InfoWindow(
      title: "Chelsea - Stamford Bridge",
      snippet: "Home of Chelsea FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
  ),
  Marker(
    markerId: const MarkerId("Emirates Stadium"),
    position: const LatLng(51.5549, -0.1084),
    infoWindow: const InfoWindow(
      title: "Arsenal - Emirates Stadium",
      snippet: "Home of Arsenal FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: const MarkerId("Tottenham Hotspur Stadium"),
    position: const LatLng(51.6043, -0.0665),
    infoWindow: const InfoWindow(
      title: "Tottenham Hotspur - Tottenham Hotspur Stadium",
      snippet: "Home of Tottenham Hotspur FC",
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
  ),
};
