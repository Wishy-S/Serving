//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'DateAndTime.dart';
import 'res_list.dart';
List<String>Rnames = List<String>();
var items = List<String>();

void main(){
  runApp(MaterialApp(
      home:HomeActivity(),
  ));
}


class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  void initState(){items.addAll(Rnames);super.initState();}
  void filterSearchResults(String query){
    if(query.isNotEmpty) {
      List<String> ds = List<String>();

      ds.addAll(Rnames);
      ds.forEach((element) {
        if (element.contains(query)) ds.add(element);
      });
      setState(() {
        items.clear();
        items.addAll(ds);
      });
      return;
    }else{
      setState(() {
        items.clear();
        items.addAll(Rnames);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double W,H;
    var isportrait =  MediaQuery.of(context).orientation == Orientation.portrait;
//    W  = MediaQuery.of(context).size.width;
//    H  = MediaQuery.of(context).size.height;
    //Need to correct here..
    if(isportrait){
      W  = MediaQuery.of(context).size.width;
      H  = MediaQuery.of(context).size.height;
    }else{
      H  = MediaQuery.of(context).size.width;
      W  = MediaQuery.of(context).size.height;
    }
      return SingleChildScrollView(
        child:ConstrainedBox(
        constraints:BoxConstraints(maxHeight: H,maxWidth: W),
        child: Scaffold(
        resizeToAvoidBottomPadding: false,

        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ResTaurant LisT"),
          backgroundColor: Colors.blue[400],
          centerTitle: true,
        ),

        body: Container(
          child: Column(
          children: <Widget>[
            //Searching bar
            Padding(
              padding:EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  filterSearchResults(value);
                },
                controller: TextEditingController(),
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)
                    ),
                  ),
                ),
              ),
            ),



            Card(color: Colors.lightGreenAccent,
              margin: EdgeInsets.fromLTRB(0,0,W-W/4,0),
              semanticContainer: true,
              borderOnForeground: true,
              shadowColor: Colors.black,
              child: SizedBox(
                height: H/18,width: W/4,
                child: Text('Whats on mood TOday',textAlign: TextAlign.center,style: TextStyle(fontSize: 14.0),),
              ),
            ),

            Container(
              height: H/4,
              width: W,
              child: StreamBuilder(
                stream: Firestore.instance.collection('Trending_list').snapshots(),//Trending list has to be made while orders are placed
                builder: (context,snapshot){
                  if(!snapshot.hasData)return const Text('Loading...');
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder:(context,index){
                          DocumentSnapshot temp = snapshot.data.documents[index];
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                height: H/4,width: W,
                                child: Image.asset('assets/images/serving.png',height: H/4,width: W),
                              ),
                              Container(
                                alignment: Alignment.topCenter,
                                height: H/4,width: W,
                                child: Text(
                                  temp['name'].toString(),
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.0),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          );
                        }
                    );
                },
              ),
            ),
     Card(color: Colors.lightGreenAccent,
      margin: EdgeInsets.fromLTRB(0,0,W-W/4,0),
      semanticContainer: true,
      borderOnForeground: true,
      shadowColor: Colors.black,
      child: SizedBox(
           height: H/18,width: W/4,
           child: Text('Browse More',textAlign: TextAlign.center,style: TextStyle(fontSize: 14.0),),
       ),
     ),

       Container(
           //problematic  place
           height: .35*H,
           width: W,
           color: Colors.grey,
       child:StreamBuilder(
                 stream: Firestore.instance.collection('Restaurant_names').snapshots(),
                 builder: (context, snapshot) {
                  if(!snapshot.hasData)return const Text('Loading...');
                  return Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder:(context,index){
                            DocumentSnapshot temp = snapshot.data.documents[index];
                            temp.data.forEach((key, value) {if(key.toString()=='name')Rnames.add(value);});
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  hoverColor: Colors.grey,
                                  title: Text(temp['name'].toString(),
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                    fontFamily:'britanic',
                                  ),
                                  ),
                                onTap: (){
//                        //print();

                                  temp.data.forEach((key, value) {print(key+" : "+ value.toString());});
                                  Fluttertoast.showToast(
                                      msg: temp['name'].toString() + " selected "+temp['OT'].toString()+"  to  " + temp['CT'].toString(),
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 13.0
                                  );
                                },
                                  leading:Image.asset('assets/images/serving.png',
                                  fit: BoxFit.cover,
                                  ),
                                  subtitle: new Text(
                                    "Menu :" + temp['Dishes'].toString()+  "\n" +
                                        "Locations:${temp['Locations'].toString()}\n",
                                    style:TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 15,
                                    ),

                                  ),
                               ),
                              ),
                            );
                          }
                ),
                      ),
                    ],
                  );
              }

            ),
       ),
            RaisedButton(onPressed: (){},
            child: Text('S E E   M O R E ',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,fontFamily: 'britanic',color:Colors.black,backgroundColor: Colors.red[200] ),
              ),
            ),

],
          ),
        ),
    ),
      ),
      );

  }

}




