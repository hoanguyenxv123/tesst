import 'package:flutter/material.dart';
import 'package:to_do_list/screens/demo/demo_screen.dart';

/// MyApp là widget chính của ứng dụng
class MyApp extends StatelessWidget {
  /// Constructor của MyApp
  const MyApp({super.key});

  /// Hàm build chứa nội dung của ứng dụng
  @override
  Widget build(BuildContext context) {
    /// MaterialApp là một widget cung cấp các thuộc tính cơ bản cho ứng dụng
    return MaterialApp(
      /// Tiêu đề của ứng dụng
      title: 'To-Do List',

      /// Route mặc định của ứng dụng
      // initialRoute: HomeScreen.routeName,

      home: const DemoScreen(),

      /// Route của ứng dụng
      // onGenerateRoute: (settings) {
      //   switch (settings.name) {
      //     case HomeScreen.routeName:
      //       return MaterialPageRoute(builder: (context) => const HomeScreen());
      //     case NewTaskScreen.routeName:
      //       return MaterialPageRoute(
      //         builder: (context) => NewTaskScreen(
      //           arguments: settings.arguments as NewTaskScreenArguments,
      //         ),
      //       );
      //     case AllTasksScreen.routeName:
      //       return MaterialPageRoute(
      //         builder: (context) => AllTasksScreen(
      //           arguments: settings.arguments as AllTasksScreenArguments,
      //         ),
      //       );
      //     default:
      //       return null;
      //   }
      // },

      /// Ẩn biểu tượng "Debug" trên màn hình
      debugShowCheckedModeBanner: false,

      /// Chủ đề của ứng dụng
      theme: ThemeData.light(useMaterial3: true),

      /// Chủ đề tối của ứng dụng
      darkTheme: ThemeData.dark(useMaterial3: true),

      /// Chủ đề mặc định của ứng dụng
      themeMode: ThemeMode.dark,
    );
  }
}
