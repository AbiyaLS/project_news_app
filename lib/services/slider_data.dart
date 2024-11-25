import 'package:newsapp_project/models/slider_model.dart';

List<SliderModel> getSliders(){
  List<SliderModel> slider=[];
  SliderModel sliderModel= SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage="images/world.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="images/business.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="images/tech.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="images/entertainment.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();


  return slider;
}