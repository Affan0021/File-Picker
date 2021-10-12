import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main()
{
  runApp(MaterialApp(

    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);


  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Stack(

          children: [

            Container(
              margin: EdgeInsets.only(top: 400),
              child: ElevatedButton(

                  onPressed: () async{

                    final result = await FilePicker.platform.pickFiles();
                    if(result == null) return ;

                    final file = result.files.first;
                    openFile(file);
                  },
                  child : Text('pick file')


              ),

            )


          ],


        ),


      ),
    );



  }
}
void openFile(PlatformFile file){
  OpenFile.open(file.path!);
}
