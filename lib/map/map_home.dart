import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';

class MapHomePage extends StatefulWidget {
  const MapHomePage({super.key});

  @override
  _MapHomePageState createState() => _MapHomePageState();
}

class _MapHomePageState extends State<MapHomePage> {
  late GoogleMapController mapController;
  final Set<Marker> _allMarkers = {};
  final Set<Marker> _visibleMarkers = {};
  final Set<Marker> _clusterMarkers = {};
  LatLng? _currentPosition;
  String? _selectedStoreName;
  String? _selectedStoreDetails;
  double _currentZoom = 18.0;

  final List<Map<String, dynamic>> stores = [
    {'name': 'Store 1', 'lat': 37.505080, 'lng': 126.954930, 'details': 'Details about Store 1'},
    {'name': 'Store 2', 'lat': 37.506080, 'lng': 126.955930, 'details': 'Details about Store 2'},
    {'name': 'Store 3', 'lat': 37.507080, 'lng': 126.956930, 'details': 'Details about Store 3'},
    // 추가 가게 정보
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addStoreMarkers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationError('Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showLocationError('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showLocationError('Location permissions are permanently denied.');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _addMarker(_currentPosition!, 'Current Location', 'This is your current location.');
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _addMarker(_currentPosition!, 'Current Location', 'This is your current location.');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: _currentPosition!,
              zoom: _currentZoom,
            ),
          ),
        );
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(null);

    if (_currentPosition != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition!,
            zoom: _currentZoom,
          ),
        ),
      );
    }
  }

  void _addMarker(LatLng position, String title, String snippet) {
    final marker = Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
      ),
      onTap: () {
        setState(() {
          _selectedStoreName = title;
          _selectedStoreDetails = snippet;
        });
        mapController.showMarkerInfoWindow(MarkerId(position.toString()));
      },
      icon: BitmapDescriptor.defaultMarker,
    );
    setState(() {
      _allMarkers.add(marker);
      if (_currentZoom >= 15.0) {
        _visibleMarkers.add(marker);
      } else {
        _clusterMarkers.clear();
        _clusterMarkers.addAll(_createClusters());
      }
    });
  }

  void _addStoreMarkers() {
    for (var store in stores) {
      _addMarker(
        LatLng(store['lat'], store['lng']),
        store['name'],
        store['details'],
      );
    }
  }

  void _showLocationError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _goToCurrentLocation() {
    if (_currentPosition != null) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition!,
            zoom: _currentZoom,
          ),
        ),
      );
    }
  }

  void _updateVisibleMarkers(double zoom) {
    setState(() {
      _visibleMarkers.clear();
      if (zoom >= 15.0) {
        _visibleMarkers.addAll(_allMarkers);
        _clusterMarkers.clear();
      } else {
        _visibleMarkers.clear();
        _clusterMarkers.clear();
        _clusterMarkers.addAll(_createClusters());
      }
    });
  }

  Set<Marker> _createClusters() {
    final clusters = <LatLng, int>{};
    final clusterMarkers = <Marker>{};
    const clusterDistance = 0.02;

    for (var marker in _allMarkers) {
      bool added = false;
      for (var cluster in clusters.keys) {
        if ((marker.position.latitude - cluster.latitude).abs() < clusterDistance &&
            (marker.position.longitude - cluster.longitude).abs() < clusterDistance) {
          clusters[cluster] = clusters[cluster]! + 1;
          added = true;
          break;
        }
      }
      if (!added) {
        clusters[marker.position] = 1;
      }
    }

    clusters.forEach((position, count) {
      clusterMarkers.add(
        Marker(
          markerId: MarkerId('cluster_$position'),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(
            title: '$count markers',
            snippet: 'Zoom in to see details',
          ),
        ),
      );
    });

    return clusterMarkers;
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _selectedStoreName = null;
      _selectedStoreDetails = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: _onMapTapped,
            onMapCreated: _onMapCreated,
            onCameraMove: (CameraPosition position) {
              _currentZoom = position.zoom;
              _updateVisibleMarkers(_currentZoom);
            },
            mapType: MapType.normal,
            initialCameraPosition: _currentPosition != null
                ? CameraPosition(
              target: _currentPosition!,
              zoom: _currentZoom,
            )
                : CameraPosition(
              target: LatLng(37.50508097213444, 126.95493073306663),
              zoom: _currentZoom,
            ),
            markers: _currentZoom >= 15.0 ? _visibleMarkers : _clusterMarkers,
          ),
          if (_selectedStoreName != null)
            Positioned(
              bottom: 50,
              left: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreDetailsPage(
                        name: _selectedStoreName!,
                        details: _selectedStoreDetails!,
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedStoreName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(_selectedStoreDetails!),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCurrentLocation,
        child: Icon(Icons.my_location),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class StoreDetailsPage extends StatelessWidget {
  final String name;
  final String details;

  const StoreDetailsPage({required this.name, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(details),
      ),
    );
  }
}