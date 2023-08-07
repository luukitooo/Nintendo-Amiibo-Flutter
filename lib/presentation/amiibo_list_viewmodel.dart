import 'package:amiibo_app_flutter/remote/amiibo_repository.dart';
import 'package:flutter/material.dart';
import '../remote/amiibo_model.dart';

class AmiiboListViewModel extends ChangeNotifier {

  final AmiiboRepository _repository = AmiiboRepository();

  final AmiiboListScreenData _screenData = AmiiboListScreenData(
      categories: [],
      selectedCategory: "",
      amiiboList: []
  );
  AmiiboListScreenData get screenData => _screenData;

  AmiiboListViewModel() { init(); }

  init() async {
    await fetchCategories();
    await fetchAmiibo(_screenData.selectedCategory);
  }

  Future<void> updateSelectedCategory(String newValue) async {
    if (newValue == _screenData.selectedCategory) {
      return;
    }
    _screenData.selectedCategory = newValue;
    notifyListeners();
    fetchAmiibo(newValue);
  }

  Future<void> fetchAmiibo(String category) async {
    _screenData.amiiboList = [];
    notifyListeners();
    _screenData.amiiboList = (await _repository.fetchAmiibo())
        .where((element) => element.amiiboSeries == category)
        .toList();
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _screenData.categories = await _repository.fetchCategories();
    _screenData.selectedCategory = _screenData.categories[0];
    notifyListeners();
  }
}

class AmiiboListScreenData {
  late List<String> categories;
  late String selectedCategory;
  late List<AmiiboDto> amiiboList;

  AmiiboListScreenData({
    required this.categories,
    required this.selectedCategory,
    required this.amiiboList
  });
}