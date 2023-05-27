import 'package:flutter/material.dart';
import 'package:flutter_hive_nosql_local_storage_database/Boxes/boxes.dart';
import 'package:flutter_hive_nosql_local_storage_database/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';



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
        title: Text("Notes App"),
      ),


      body: ValueListenableBuilder<Box<NotesModel>>(
         valueListenable: Boxes.getData().listenable(),
         builder:(context, box, _){
           var data = box.values.toList().cast<NotesModel>();
          
           return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder:(context, index) {
              return Card(
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(data[index].title.toString()),
                        Text(data[index].description.toString())
                    ],
                  ),
                ),
              );
              
           },);
      },),



      
      
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
        Navigator.pop(context);

         
        }, child:Text("Add"))
      ],
    );
  },);
}



  
}