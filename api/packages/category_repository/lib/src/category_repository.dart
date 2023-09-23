import 'package:models/models.dart';

class CategoryRepository {
  Future<Category> getCategoryById(String categoryId) async {
    // TODO: Connect with the database to retrieve the category by id
    return Category.sampleData
        .firstWhere((category) => category.id == categoryId);
  }

  Future<List<Category>> getCategories() async {
    // TODO: Connect with the database to retrieve the categories
    return Category.sampleData;
  }
}
