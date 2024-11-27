import 'package:newsapp_project/models/slider_model.dart';

List<SliderModel> getSliders(){
  List<SliderModel> slider=[];
  SliderModel sliderModel= SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage="assets/world.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="assets/business.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="assets/tech.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();

  sliderModel.sliderName= "Bow to the Authority of SilentForce";
  sliderModel.sliderImage ="assets/entertainment.jpg";
  slider.add(sliderModel);
  sliderModel=new SliderModel();


  return slider;
}