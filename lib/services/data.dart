import 'package:newsapp_project/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  category.add(CategoryModel()
    ..categoryName = "World"
    ..image = "images/world.jpg");

  category.add(CategoryModel()
    ..categoryName = "Business"
    ..image = "images/business.jpg");

  category.add(CategoryModel()
    ..categoryName = "Technology"
    ..image = "images/tech.jpg");

  category.add(CategoryModel()
    ..categoryName = "Entertainment"
    ..image = "images/entertainment.jpg");

  category.add(CategoryModel()
    ..categoryName = "Sports"
    ..image = "images/sports.jpg");

  category.add(CategoryModel()
    ..categoryName = "Science"
    ..image = "images/science.jpg");

  category.add(CategoryModel()
    ..categoryName = "Health"
    ..image = "images/health.jpg");

  return category;
}
