import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
class flipkrt extends StatefulWidget {
  const flipkrt({Key key}) : super(key: key);

  @override
  _flipkrtState createState() => _flipkrtState();
}

class _flipkrtState extends State<flipkrt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(height: 150,
          width:MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: ListTile(leading: Icon(Icons.view_headline),
                title: Text("Flipkart",style:TextStyle(
                  fontSize: 30,color: Colors.white,
                ),
                ),
              subtitle: Text("ExplorePlus",style:TextStyle(
                  fontSize: 15,color: Colors.white,),),
              trailing: Icon(Icons.notifications,color: Colors.white,),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Container(height: 40,
                child: TextField(obscureText: true,

                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    fillColor: Colors.white,
                    filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Search for products,Brands and More",
                  ),
                ),
              ),
            ),








          ],),),
          Container(height: 70,
            color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,

            children: [

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 8.0,top: 8.0),

              child: Column(
                children: [
                  CircleAvatar(child: Icon(Icons.list_outlined)),
                  Text("All Categories",style: TextStyle(fontSize: 10),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 50,width: 50,
                  color: Colors.white,
              child: Column(
                children: [
                  Image.asset("images/ess.jpeg",height: 40,),
                  Text("Essentials",style: TextStyle(fontSize: 10),)
                ],
              ),),
            ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 50,width: 50,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset("images/ess.jpeg",height: 40,),
                      Text("Offer zone",style: TextStyle(fontSize: 10),)
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 50,width: 50,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset("images/ess.jpeg",height: 40,),
                      Text("Mobiles",style: TextStyle(fontSize: 10),)
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 50,width: 50,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset("images/ess.jpeg",height: 40,),
                      Text("Fashion",style: TextStyle(fontSize: 10),)
                    ],
                  ),),
              ),


          ],),),

          Container(height: 220,
              child: Carousel(
                boxFit: BoxFit.fill,
                images: [
                Image.asset("images/Apple.jpg",fit: BoxFit.fill),
                Image.asset("images/onepls.jpg",fit: BoxFit.fill),
                Image.asset("images/oppo.jpg",fit: BoxFit.fill),
                Image.asset("images/samsung-Logo.jpg",fit: BoxFit.fill)
              ],),),

          Container(height: 150,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Image.asset("images/Apple.jpg",height: 150,width: 120,),),
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Image.asset("images/Apple.jpg",height: 150,width: 120,),),
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Image.asset("images/Apple.jpg",height: 150,width: 120,),),
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Image.asset("images/Apple.jpg",height: 150,width: 120,),),
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Image.asset("images/Apple.jpg",height: 150,width: 120,),),
              Card(color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Image.asset("images/Apple.jpg",height: 150,width: 120,),)
            ],),
          ),
          ListTile(leading: Image.asset("images/iphonex.jpg",height: 100,width: 80,),
          title: Text("Suggested For You",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          subtitle: Text("Based on your interest"),
            trailing: Container(height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
            color: Colors.blue),
            width: 70,
            child: Center(child: Text("View All >")),),

          ),
          Container(height: 200,
              width: 150,
          child: Image.asset("images/Apple.jpg",height: 150,width: 120,),)





        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.amber,



        selectedItemColor: Colors.blue,
        items: [


          BottomNavigationBarItem(
            title: Text("Shop"),
            icon: Icon(Icons.shopping_bag_sharp),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            title: Text("Super coin"),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text(" ")


          ),

          BottomNavigationBarItem(
            title: Text("Video"),
            icon: Icon(Icons.video_settings_outlined),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            title: Text("Game zone"),

          ),



        ],),

    );
  }
}
