import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobx_bloc/map/model/map_model.dart';

abstract class IMapService {
  final Dio dio;

  IMapService(this.dio);

  Future<List<MapModel>?> fetchItems();
}

class MapService extends IMapService {
  MapService(Dio dio) : super(dio);

  @override
  Future<List<MapModel>?> fetchItems() async {
    final response =
        await Dio().get('https://fluttertr-ead5c.firebaseio.com/maps.json');

    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;
      if (_datas is List) {
        return _datas.map((e) => MapModel.fromJson(e)).toList();
      }
    }
  }
}
