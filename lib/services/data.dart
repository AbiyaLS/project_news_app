import 'package:newsapp_project/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category=[];
  CategoryModel categoryModel= CategoryModel();

  categoryModel.categoryName= "World";
  categoryModel.image ="images/world.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Business";
  categoryModel.image ="images/business.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Technology";
  categoryModel.image ="images/tech.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Entertainment";
  categoryModel.image ="images/entertainment.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Sports";
  categoryModel.image ="images/sports.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Science";
  categoryModel.image ="images/science.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  categoryModel.categoryName= "Health";
  categoryModel.image ="images/health.jpg";
  category.add(categoryModel);
  categoryModel=new CategoryModel();

  return category;
}