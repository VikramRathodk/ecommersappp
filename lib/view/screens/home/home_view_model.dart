import 'package:ecommersappp/data/models/product_model.dart';
import 'package:ecommersappp/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';

enum AppState { initial, loading, loaded, error }

class HomeViewModel extends ChangeNotifier {
  final ProductRepository _repository = ProductRepository();

  List<Product> _products = [];
  List<Product> get products => _products;

  HomeViewModel() {
    fetchProducts();
  }

  AppState _appState = AppState.initial;
  AppState get appState => _appState;

  Future<void> fetchProducts() async {
    _appState = AppState.loading;
  
    notifyListeners();
      // await Future.delayed(Duration(seconds: 2));

    try {
      _products = await _repository.getProducts();
      _appState = AppState.loaded;
    } catch (e) {
      _appState = AppState.error;
    }
    notifyListeners();
  }
}
