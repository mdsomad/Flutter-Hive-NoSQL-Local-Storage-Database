import 'package:flutter_hive_nosql_local_storage_database/models/notes_model.dart';
import 'package:hive/hive.dart';




class Boxes {


  static Box<NotesModel> getData() => Hive.box<NotesModel>("notes");
  
  
}