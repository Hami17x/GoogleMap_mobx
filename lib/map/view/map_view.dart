import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx_bloc/extension/mapmodel_markers.dart';
import 'package:mobx_bloc/map/service/map_service.dart';
import 'package:mobx_bloc/map/viewmodel/map_viewmodel.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final MapViewModel _mapViewModel;
  GoogleMapController? _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _mapViewModel = MapViewModel(MapService(Dio()));
    _mapViewModel.fetchMaps();
  }
  //baseUrl: "https://fluttertr-ead5c.firebaseio.com/")

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _googleMaps(),
          Positioned(
              right: 0, left: 0, height: 200, bottom: 100, child: _pageView())
        ],
      ),
    );
  }

  Widget _pageView() {
    return Observer(builder: (_) {
      return PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: _mapViewModel.mapItems.length,
        onPageChanged: (value) {
          _mapViewModel.changeIndex(value);
          _controller?.animateCamera(
              CameraUpdate.newLatLng(_mapViewModel.mapItems[value].latLong));
        },
        itemBuilder: (context, index) {
          return Card(
            child: Image.network(
                _mapViewModel.mapItems[index].detail?.photoUrl ?? ""),
          );
        },
      );
    });
  }

  Observer _googleMaps() {
    return Observer(builder: (_) {
      return _mapViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                _controller = controller;
              },
              markers: Set.of(_mapViewModel.mapItems
                  .toMarkers(_mapViewModel.selectedIndex)),
              initialCameraPosition: CameraPosition(
                  target: _mapViewModel.mapItems.first.latLong, zoom: 12));
    });
  }
}
