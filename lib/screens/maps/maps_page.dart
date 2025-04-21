import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fotmob/database/maps_dummy.dart';
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
  double latitude = -7.2804494;
  double longitude = 112.7947228;
  var mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
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
      body: Stack(
        children: [
          // google maps
          _buildGoogleMaps(),
          _buildDetailCard(),
        ],
      ),
    );
  }

  Widget _buildGoogleMaps() {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
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
              "https://masuk-ptn.com/images/department/5bcae2a1c24dd3deebc1db0a60266744be12f999.jpeg",
              "Politeknik Elektronika Negeri Surabaya",
              -7.2758471,
              112.7937557,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://www.its.ac.id/wp-content/uploads/2021/03/Rektorat.jpg",
              "Institut Teknologi Sepuluh Nopember",
              -7.282356,
              112.7949253,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://images.squarespace-cdn.com/content//5649db6ae4b08bab0a26acc4/1553496740912-3RTZAQAU8JSH93GTNHUP/CADIZ-GALAXY-MALL-3-05.jpg?format=2500w",
              "Galaxy Mall 3",
              -7.2756967,
              112.7806254,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://bpkad.surabaya.go.id/siwagefile/images/arifrahman/convention7.jpg",
              "Convention Hall Arief Rahman Hakim",
              -7.2886493,
              112.7836333,
            ),
            const SizedBox(width: 10),
            _displayPlaceCard(
              "https://www.pakuwoncity.com/wp-content/uploads/2020/11/Pakuwon-City-Mall-e1604998922874.jpg",
              "Pakuwon City Mall",
              -7.2768784,
              112.8061882,
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
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Text("4.9", style: TextStyle(fontSize: 15)),
                        Row(children: stars()),
                      ],
                    ),
                    const Text(
                      "Indonesia \u00B7 Kota Surabaya",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(
                      child: Text(
                        "Closed \u00B7 Open 09.00 Monday",
                        style: TextStyle(
                          color: Colors.black,
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
