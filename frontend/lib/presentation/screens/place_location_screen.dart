import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class PlaceLocationMapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String placeName;

  PlaceLocationMapScreen({
    required this.latitude,
    required this.longitude,
    required this.placeName,
  });

  @override
  _PlaceLocationMapScreenState createState() => _PlaceLocationMapScreenState();
}

class _PlaceLocationMapScreenState extends State<PlaceLocationMapScreen> {
  GoogleMapController? mapController;
  Position? _currentPosition;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Fetch current location
  void _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      _setMarkersAndRoute();
    });
  }

  // Set markers and route
  void _setMarkersAndRoute() async {
    final destination = LatLng(widget.latitude, widget.longitude);
    final currentLocation = LatLng(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    );

    _markers.addAll([
      Marker(
        markerId: MarkerId('destination'),
        position: destination,
        infoWindow: InfoWindow(title: widget.placeName),
      ),
      Marker(
        markerId: MarkerId('currentLocation'),
        position: currentLocation,
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
    ]);

    // Fetch directions
    final route = await _getRoute(currentLocation, destination);

    // Add polyline
    if (route != null) {
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: route,
        color: Colors.blue,
        width: 5,
      ));

      // Adjust camera to show both locations
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              currentLocation.latitude <= destination.latitude
                  ? currentLocation.latitude
                  : destination.latitude,
              currentLocation.longitude <= destination.longitude
                  ? currentLocation.longitude
                  : destination.longitude,
            ),
            northeast: LatLng(
              currentLocation.latitude > destination.latitude
                  ? currentLocation.latitude
                  : destination.latitude,
              currentLocation.longitude > destination.longitude
                  ? currentLocation.longitude
                  : destination.longitude,
            ),
          ),
          100,
        ),
      );
    }
  }

  // Fetch route using Google Directions API
  Future<List<LatLng>?> _getRoute(LatLng start, LatLng destination) async {
    final apiKey = "YOUR_GOOGLE_API_KEY"; // Replace with your Google API key

    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final route = data['routes'][0]['legs'][0]['steps'];

      List<LatLng> polylinePoints = [];
      for (var step in route) {
        final lat = step['end_location']['lat'];
        final lng = step['end_location']['lng'];
        polylinePoints.add(LatLng(lat, lng));
      }

      return polylinePoints;
    } else {
      print('Error fetching directions: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LatLng destination = LatLng(widget.latitude, widget.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.placeName),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: destination,
                zoom: 14,
              ),
              markers: _markers,
              polylines: _polylines,
            ),
    );
  }
}
