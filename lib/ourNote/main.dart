import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/ourNote/home_screen.dart';
import 'package:next_poject/ourNote/model_class.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:note_app/note_model.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  Hive.registerAdapter(ModelClassAdapter());
  await Hive.openBox("boxName");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// class NotesApp extends StatefulWidget {
//   const NotesApp({Key? key}) : super(key: key);
//
//   @override
//   State<NotesApp> createState() => _NotesAppState();
// }
//
// class _NotesAppState extends State<NotesApp> {
//   @override
//   void dispose() {
//     titleController.dispose();
//     bodyController.dispose();
//     Hive.close();
//     super.dispose();
//   }
//   TextEditingController titleController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//   final notes = Hive.box<NoteModel>('NotesBox');
//   @override
//   Widget build(BuildContext context) {
//     return WatchBoxBuilder(box: Hive.box('NotesBox'), builder: (context , notes) {
//       return Scaffold(
//           floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.sticky_note_2_outlined),
//             onPressed: (){
//               showModalBottomSheet(context: context, builder: (context) {
//                 return Column(
//                   children: [
//                     TextFormField(
//                       controller: titleController,
//                     ),
//                     TextFormField(
//                       controller: bodyController,
//                     ),
//                     ElevatedButton(onPressed: (){
//                       NoteModel Nextnotes = NoteModel(title: titleController.text, bodyOfNote: bodyController.text);
//                       notes.add(Nextnotes);
//                     }, child: Text("add"))
//                   ],
//                 );
//               });
//             },
//           ),
//           appBar: AppBar(
//             title: Text("Notes App"),
//           ),
//           body: ListView.builder(
//               itemCount: notes.length,
//               itemBuilder: (BuildContext context ,int item ) {
//                 final not = notes.get(item) as NoteModel;
//                 return Container(
//                   child: Column(
//                     children: [
//                       Text(not.title),
//                       Text(not.bodyOfNote),
//
//                     ],
//                   ),
//                 );
//               })
//       );
//     }) ;
//   }
// }
