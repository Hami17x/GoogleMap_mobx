import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:mobx_bloc/map/model/map_model.dart';
import 'package:mobx_bloc/map/service/map_service.dart';
part 'map_viewmodel.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  final IMapService mapService;
  @observable
  bool isLoading = false;
  @observable
  List<MapModel> mapItems = [];
  @observable
  int selectedIndex = 0;

  _MapViewModelBase(this.mapService);

  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void changeIndex(int x) {
    selectedIndex = x;
  }

  @action
  Future<void> fetchMaps() async {
    _changeLoading();
    mapItems = (await mapService.fetchItems()) ?? [];
    inspect(mapItems);
    _changeLoading();
  }
}
