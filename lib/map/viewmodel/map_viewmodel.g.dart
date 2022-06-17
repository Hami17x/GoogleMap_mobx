// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MapViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$mapItemsAtom =
      Atom(name: '_MapViewModelBase.mapItems', context: context);

  @override
  List<MapModel> get mapItems {
    _$mapItemsAtom.reportRead();
    return super.mapItems;
  }

  @override
  set mapItems(List<MapModel> value) {
    _$mapItemsAtom.reportWrite(value, super.mapItems, () {
      super.mapItems = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_MapViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$fetchMapsAsyncAction =
      AsyncAction('_MapViewModelBase.fetchMaps', context: context);

  @override
  Future<void> fetchMaps() {
    return _$fetchMapsAsyncAction.run(() => super.fetchMaps());
  }

  late final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase', context: context);

  @override
  void changeIndex(int x) {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.changeIndex');
    try {
      return super.changeIndex(x);
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
mapItems: ${mapItems},
selectedIndex: ${selectedIndex}
    ''';
  }
}
