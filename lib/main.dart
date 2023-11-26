import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gobooke/src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
    //   return MultiRepositoryProvider(
    //     providers: [], // App에서 사용되는 모든 repository 저장
    //     child: MultiBlocProvider(
    //       providers: [],
    //       child: App(),
    //     ),
    //   );
    // }
  }
}
