import 'package:models/models.dart';

class CategoryRepository {
  Future<Category> getCategoryById(String categoryId) async {
    return Category.sampleData
        .firstWhere((category) => category.id == categoryId);
  }

  Future<List<Category>> getCategories() async {
    return Category.sampleData;
  }
}
