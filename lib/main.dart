import 'dart:io';

import 'package:example1/data/data.dart';
import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFirstAppFlutter',
      home: Home(),
      debugShowCheckedModeBanner: false, //sirve para notificar la revision de bugs
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> slides = new List<SliderModel>(); //controla el slide
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() { 
    super.initState();
    slides = getSlides(); //getSlides se encuentra en data.dart

  }

  Widget pageIndexIndicator(bool isCurrentPage){    //Esto es para los puntitos que aparecen en medio
    return Container(
      margin: EdgeInsets.symmetric(horizontal:2.0),
      height: isCurrentPage ? 10.0 : 6.0 ,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,   //controla el numero de slides
        onPageChanged: (val){
          setState(() {
            currentIndex = val;
          });
        },
        itemBuilder: (context, index){
          return SliderTile(
            imageAssetPath: slides[index].getImageAssetPath(),
            title: slides[index].getTitle(),
            desc: slides[index].getDesc()
          );
        },),
         //esto es para los botones del footer
        bottomSheet: currentIndex != slides.length - 1 ? Container(
          height: Platform.isIOS ? 70:60,
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector (     //Determina si el boton es clickeado
                onTap: (){
                  pageController.animateToPage(slides.length - 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text('SKIP', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),)
                ),
                Row (
                  children: <Widget>[
                    for (int i = 0; i < slides.length; i++)currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
                  ],
                ),
                 GestureDetector (     //Determina si el boton es clickeado
                onTap: (){
                  pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                child: Text('NEXT', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                  ),)
                ),
            ],
          )
        ): Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: Platform.isIOS ? 70:60,
          color: Colors.deepOrangeAccent,
          child: Text("EMPEZAR", style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25
          ),),
        ),   
    );
  }
}


class SliderTile extends StatelessWidget {
  
  String imageAssetPath, title, desc;
  SliderTile({this.imageAssetPath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal:20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,    //para alinear todos los componentes
        children: <Widget>[
        Image.asset(imageAssetPath  ),
        SizedBox(height: 30,),
        Text(title, style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20
        ),),  //titulo
        SizedBox(height: 20,),
        Text(desc,textAlign: TextAlign.center, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          ),)  //descripcion
      ],
      ),
    );
  }
}