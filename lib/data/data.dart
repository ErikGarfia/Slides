class SliderModel {
  String imagePath;
  String title;
  String desc;
  
  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagepath){
    imagePath = getImagepath;
  }

  void setTitle (String getTitle){
    title = getTitle;
  }

  void setDesc (String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }  
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //PRIMER SLIDE
  sliderModel.setImageAssetPath("assets/draw1.png");
  sliderModel.setTitle("Slide One");
  sliderModel.setDesc("Aquí va la descripcion del primer slide");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //SEGUNDA SLIDE
  sliderModel.setImageAssetPath("assets/draw2.png");
  sliderModel.setTitle("Slide Two");
  sliderModel.setDesc("Aquí va la descripcion del segundo slide");
  slides.add(sliderModel);
  
  sliderModel = new SliderModel();

  //TERCERA SLIDE
  sliderModel.setImageAssetPath("assets/draw3.png");
  sliderModel.setTitle("Slide Three");
  sliderModel.setDesc("Aquí va la descripcion del tercer slide");
  slides.add(sliderModel);
  
  sliderModel = new SliderModel();

  return slides;
}