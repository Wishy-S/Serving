import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(SignUp());
}
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Sign Up",style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Rest name'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Address'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Rest rating '
                ),
              ),
            ),
            Container(
              width: 300,
              height: 45,
              child: RaisedButton(
                onPressed: (){

                },
                child: Text('SIGN UP'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.grey,
              ),
            ),
            Text("or Sign up with social Account"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 120,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: (){},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Facebook"),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 120,
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: (){},
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Twitter"),
                  ),

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

