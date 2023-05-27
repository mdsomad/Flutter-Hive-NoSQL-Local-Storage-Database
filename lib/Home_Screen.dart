import 'package:flutter/material.dart';
import 'package:flutter_hive_nosql_local_storage_database/Boxes/boxes.dart';
import 'package:flutter_hive_nosql_local_storage_database/models/notes_model.dart';
import 'package:hive/hive.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final titleController = TextEditingController();
final descriptionController = TextEditingController();
  
  
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


                
              ],
            );
            
          },)
        ],
      ),
      
      
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        
       _showdMydialog();
        
      },
      child: Icon(Icons.add),
      ),
      
    );
  }



Future<void> _showdMydialog(){
  return showDialog(context: context, builder:(context) {
    
    return AlertDialog(
      title: Text("Add Notes"),

      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title",
                border: OutlineInputBorder()
              ),
            ),

           const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: "Enter description",
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
      
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child:Text("Cancel")),


        TextButton(onPressed: (){
          
        final data = NotesModel(title: titleController.text, description: descriptionController.text);

        final box = Boxes.getData();

        box.add(data);
        
        print(box);
        
        data.save();
        titleController.clear();
        descriptionController.clear();

         
        }, child:Text("Add"))
      ],
    );
  },);
}



  
}