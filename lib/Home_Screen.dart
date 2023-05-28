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
        builder: (context, box, _) {

         List<NotesModel> data = box.values.toList().cast<NotesModel>();
         //var data = box.values.toList().cast<NotesModel>();

          return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [

                          Text(data[index].title.toString()),

                          Spacer(),

                          InkWell(
                              onTap: () {

                                //* delete Function call
                                delete(data[index]);

                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),


                          const SizedBox(
                            width: 15,
                          ),

                          InkWell(
                              onTap: () {

                                 //*_editDialog Function call
                                _editDialog(data[index],data[index].title,data[index].description.toString());

                              },
                              child: Icon(Icons.edit)),
                        ],
                      ),

                      Text(data[index].description.toString())

                    ],

                  ), //* Colume End
                ), //* Padding End
 
              ); //* Card

            },
          ); //* ListView.builder End


        },
      ), //* ValueListenableBuilder End


      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _showdMydialog();    //* <-- _showdMydialog Function call
        },
        child: Icon(Icons.add),
      ),




    );
  }






//TODO Create delete Function
  void delete(NotesModel notesModel) async {

    await notesModel.delete();

    // Boxes.getData().clear();  //* <-- ALl Data deleted
    
  }









//TODO Create EditDialog Function
  Future<void> _editDialog(

    NotesModel notesModel, String title, String description) {
    titleController.text = title;
    descriptionController.text = description;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Notes"),
          content: SingleChildScrollView(
            child: Column(
              children: [

                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Enter title", border: OutlineInputBorder()),
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
            TextButton(
                onPressed: () {

                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);

                },
                child: Text("Cancel")),

            TextButton(
                onPressed: () async {

                  notesModel.title = titleController.text.toString();
                  notesModel.description = descriptionController.text.toString();

                  await notesModel.save();

                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);


                },
                child: Text("Edit"))
          ],
        );
      },
    );
  }







//TODO Create Data Add ShowDialog Function
  Future<void> _showdMydialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Notes"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Enter title", border: OutlineInputBorder()),
                ),

                const SizedBox(
                  height: 10,
                ),


                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      hintText: "Enter description",
                      border: OutlineInputBorder()),
                )
              ],
            ),
          ),


          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            TextButton(
                onPressed: () {
                  final data = NotesModel(
                      title: titleController.text,
                      description: descriptionController.text);

                  final box = Boxes.getData();

                  box.add(data);

                  print(box);

                  data.save();

                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                },
                child: Text("Add"))
          ],
        );
      },
    );
  }










}
