import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx_bloc/map/model/map_model.dart';

extension MapMarkerExtension on List<MapModel> {
  Set<Marker> toMarkers(int selected) {
    // ignore: unnecessary_this
    return Set.of(this.map((e) => Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(this[selected] == e
            ? BitmapDescriptor.hueGreen
            : BitmapDescriptor.hueAzure),
        markerId: MarkerId("${e.lat}"),
        position: e.latLong)));
  }
}
