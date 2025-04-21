import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fotmob/database/maps_dummy.dart'; // Importing the correct file
import 'package:fotmob/utils/colors.dart';
import 'package:fotmob/utils/map_type_google.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});
  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  double latitude = 53.4631;
  double longitude = -2.2913;
  var mapType = MapType.normal;

  // Custom map style that ensures text is black
  static const String _mapStyle = '''
  [
    {
      "elementType": "labels.text",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#ffffff"
        }
      ]
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlackGray,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Football Stadiums Map",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: onSelectedMapType,
            itemBuilder: (context) {
              return googleMapTypes.map((typeGoogle) {
                return PopupMenuItem(
                  value: typeGoogle.type,
                  child: Text(typeGoogle.type.name),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Stack(children: [_buildGoogleMaps(), _buildDetailCard()]),
    );
  }

  Widget _buildGoogleMaps() {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 10,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        controller.setMapStyle(_mapStyle);
      },
      markers: markers,
    );
  }

  void onSelectedMapType(Type value) {
    setState(() {
      switch (value) {
        case Type.normal:
          mapType = MapType.normal;
          break;
        case Type.hybrid:
          mapType = MapType.hybrid;
          break;
        case Type.terrain:
          mapType = MapType.terrain;
          break;
        case Type.satellite:
          mapType = MapType.satellite;
          break;
      }
    });

    // Re-apply the style to ensure text stays black when map type changes
    _controller.future.then((controller) {
      if (mapType == MapType.normal) {
        controller.setMapStyle(_mapStyle);
      }
    });
  }

  _buildDetailCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://static.toiimg.com/thumb/resizemode-4,width-1280,height-720,msid-118886268/118886268.jpg",
              "Manchester United - Old Trafford",
              53.4631,
              -2.2913,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://www.mancity.com/meta/media/qlofj44a/tf_13049.jpg?width=1620",
              "Manchester City - Etihad Stadium",
              53.4831,
              -2.2004,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://www.terraco.com/id/wp-content/uploads/2020/12/Liverpool-Banner-2.png",
              "Liverpool - Anfield",
              53.4308,
              -2.9608,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://icdn.chelsea.news/wp-content/uploads/2023/07/stamford-bridge-redevelopment-qedsa-768x768.jpg",
              "Chelsea - Stamford Bridge",
              51.4816,
              -0.1910,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://londontickets.tours/wp-content/uploads/2023/05/emirates-stadium-arsenal.jpg",
              "Arsenal - Emirates Stadium",
              51.5549,
              -0.1084,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://i.eurosport.com/2019/04/03/2557813-53054975-2560-1440.jpg",
              "Tottenham Hotspur Stadium",
              51.6043,
              -0.0665,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  _displayPlaceCard(String imageUrl, String name, double lat, double lgn) {
    return GestureDetector(
      onTap: () {
        _onClickPlaceCard(lat, lgn);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 90,
        margin: const EdgeInsets.only(bottom: 30),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          elevation: 10,
          child: Row(
            children: [
              Container(
                width: 90,
                height: 90,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 200,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color:
                            Colors.black, // Explicitly set text color to black
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Text(
                          "5.0",
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Colors
                                    .black, // Explicitly set text color to black
                          ),
                        ),
                        Row(children: stars()),
                      ],
                    ),
                    const Text(
                      "Premier League \u00B7 England",
                      style: TextStyle(
                        color:
                            Colors.black, // Explicitly set text color to black
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(
                      child: Text(
                        "Match days and Stadium tours",
                        style: TextStyle(
                          color:
                              Colors
                                  .black, // Explicitly set text color to black
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> stars() {
    List<Widget> list1 = [];
    for (var i = 0; i < 5; i++) {
      list1.add(const Icon(Icons.star, color: Colors.orange, size: 15));
    }
    return list1;
  }

  void _onClickPlaceCard(double lat, double lgn) async {
    setState(() {
      latitude = lat;
      longitude = lgn;
    });
    GoogleMapController controller = await _controller.future;
    final cameraPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 17,
      bearing: 192,
      tilt: 55,
    );
    final cameraUpdate = CameraUpdate.newCameraPosition(cameraPosition);
    controller.animateCamera(cameraUpdate);
  }
}
