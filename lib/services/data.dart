import 'package:newsapp_project/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];
  CategoryModel categoryModel= CategoryModel();

  categoryModel.categoryName= "World";
  categoryModel.image ="assets/world.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Business";
  categoryModel.image ="assets/business.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Technology";
  categoryModel.image ="assets/tech.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Entertainment";
  categoryModel.image ="assets/entertainment.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Sports";
  categoryModel.image ="assets/sports.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Science";
  categoryModel.image ="assets/science.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Health";
  categoryModel.image ="assets/health.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  return category;
}