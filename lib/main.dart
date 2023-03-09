import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:next_poject/home/first_screen.dart';
import 'package:next_poject/home/splash_screen.dart';
import 'package:next_poject/ourNote/model_class.dart';
import 'package:path_provider/path_provider.dart';

void main() async {

  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  //
  // Hive.registerAdapter(NoteModelsAdapter());
  // await Hive.openBox<NoteModels>('keepNote');
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ModelClassAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}


// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark ));
//
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => NotesBloc()),
//         BlocProvider(create: (context) => GeneralBloc()),
//       ],
//       child: MaterialApp(
//         theme: ThemeData.dark(),
//         title: 'Keep Note - Fraved',
//         debugShowCheckedModeBanner: false,
//         home: SplashScreen(),
//       ),
//     );
//   }
// }