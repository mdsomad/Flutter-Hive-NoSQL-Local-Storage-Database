import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
      ),


      body: Column(
        children: [
          FutureBuilder(
            future: Hive.openBox("Somad") ,
            builder:(context, snapshot) {

            return Column(
              children: [

                ListTile(
                  title:Text(snapshot.data!.get("name").toString()),
                  subtitle:Text(snapshot.data!.get("age").toString()) ,

                  trailing: IconButton(onPressed: (){

                     // snapshot.data!.put("name", "Md Somad Updata");   //* <-- Data Updata
                     // snapshot.data!.put("age",26);                    //* <-- Data Updata

                     snapshot.data!.delete("name");                      //* <-- Data delete

                     setState(() {
                       
                     });

                  }, icon:Icon(Icons.edit)),
                )
                
              ],
            );
            
          },)
        ],
      ),
      
      
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        
        //TODO Create Box 
        var box = await Hive.openBox("Somad");

        //TODO Create Multiple Box 
        var box2 = await Hive.openBox("MultipleBoxCreate");

        box2.put("NewBox", "New Box Data Add");

        box.put("name", "Md Somad");     //* <-- Data Add
        box.put("age",20);               //* <-- Data Add
        box.put("userdetails",{          //* <-- Object data Add
          'name':"Amir",
          'city':"islampur",
          "country":"India"
        });

        print(box.get("name"));                    //* <-- Data get
        print(box.get("age"));
        print(box.get("userdetails")['city']);    //* <-- Object data get

        print(box2.get('NewBox'));                //* <-- New Box2 Data get
         
        
      },
      child: Icon(Icons.add),
      ),
      
    );
  }
}