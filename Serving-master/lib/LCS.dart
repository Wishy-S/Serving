import 'package:firstflutter/Home_activity.dart';
import 'package:firstflutter/Signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home_activity.dart';
import 'DateAndTime.dart';
void main() {
  runApp(lcs());

}
class lcs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double W,H;
    var isportrait =  MediaQuery.of(context).orientation == Orientation.portrait;
    if(isportrait){
     W  = MediaQuery.of(context).size.width;
     H  = MediaQuery.of(context).size.height;
    }else{
      H  = MediaQuery.of(context).size.width;
      W  = MediaQuery.of(context).size.height;
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
    child:ConstrainedBox(
      constraints:BoxConstraints(maxWidth: W,maxHeight: H),
      child:Scaffold(
      resizeToAvoidBottomPadding: false,
        body:Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("assets/images/serving.png"),
                Padding(
                    padding: new EdgeInsets.only(left:0,top:250,right:0,bottom: 20),
                    child:Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [
                        SingleChildScrollView(
                          child: RaisedButton(
                            splashColor:Color.fromARGB(125, 0, 0, 0),
                            padding:EdgeInsets.only(left:60,top:20,right:60 ,bottom: 20),
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black,width:2.0,style: BorderStyle.solid)),
                            child: Text("LOGIN",
                              style: new TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255,1,1,1)
                              ),
                            ),
                            onPressed: ()=>{
                            Navigator.push(context,
                            new MaterialPageRoute(builder: (context)=>new HomeActivity()
                            ),
                            ),
                            },
                          ),
                        ),
                        SingleChildScrollView(
                          child: RaisedButton(
                            splashColor:Color.fromARGB(125, 255, 255, 255),
                            padding:EdgeInsets.only(left:60,top:20,right:60 ,bottom: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black,width:2.0,style: BorderStyle.solid)),
                            color: Color.fromARGB(255, 1, 1, 1),
                            child: Text("SIGN UP",
                              style: new TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20
                              ),),
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(
                                builder: (context)=>SignUp(),
                              ));
                            }
                          ),
                        )
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child:new Container(
                    height: 10.0,
                    width: 200.0,
                    padding: EdgeInsets.only(bottom: 30),
                    color: Colors.black,
                  ),
                )
              ]
          ),
        ),
      floatingActionButton:
      FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        label: Text("PUSH ME!!"),
        onPressed:(){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=>new timePickerPage()
          ));
        },
      ),
    ),
    ),
    );
  }
}