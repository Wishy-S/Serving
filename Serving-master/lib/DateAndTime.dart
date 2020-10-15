import 'package:flutter/material.dart';
TimeOfDay otime = TimeOfDay.now();
TimeOfDay ctime = TimeOfDay.now();
void main(){
  runApp(MaterialApp(
    home:timePickerPage(),
  ));
}
class timePickerPage extends StatefulWidget {
  @override
  _timePickerPageState createState() => _timePickerPageState();
}

class _timePickerPageState extends State<timePickerPage> {
  TimeOfDay t ;
  Future<Null> selectOpeningTime(BuildContext context) async {
    t = await showTimePicker(context: context,
        initialTime: otime);

    if (t!=null&& otime!=t ) {
      setState(() {
        otime = t;
      });
    }
  }
  Future<Null> selectClosingTime(BuildContext context) async {
    t = await showTimePicker(context: context,
        initialTime: ctime);

    if (t!=null&& ctime!=t ) {
      setState(() {
        ctime = t;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TimePicker"),
      ),
      body:ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text("Enter Opening Time"),
              onTap: (){
                selectOpeningTime(context);
              },
              subtitle: Text(otime.toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text("Enter Closing Time"),
              onTap: (){
                selectClosingTime(context);
              },
              subtitle: Text(ctime.toString()),
            ),
          ),
        ],
      ),
    );


}

}