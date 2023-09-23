import 'package:category_repository/category_repository.dart';
import 'package:dart_frog/dart_frog.dart';

final _categoryRepository = CategoryRepository();

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<CategoryRepository>((_) => _categoryRepository));
}
