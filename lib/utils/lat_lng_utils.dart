import 'package:latlng/latlng.dart';
import 'dart:math' show cos, sqrt, asin;

extension LatLngUtils on LatLng {
  double getDistance(LatLng other){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((other.latitude - latitude) * p)/2 +
        c(latitude * p) * c(other.latitude * p) *
            (1 - c((other.longitude - longitude) * p))/2;
    return 12742 * asin(sqrt(a));
  }
}

LatLng getCenterLatLng(List<LatLng> list){
  LatLng result = const LatLng(0, 0);
  final length = list.length;
  for(final e in list){
    result = LatLng(result.latitude + e.latitude, result.longitude + e.longitude);
  }
  return LatLng(result.latitude / length, result.longitude / length);
}