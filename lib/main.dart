import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gobooke/firebase_options.dart';
import 'package:gobooke/src/app.dart';
import 'package:gobooke/src/common/cubit/app_data_load_cubit.dart';
import 'package:gobooke/src/common/interceptor/custom_interceptor.dart';
import 'package:gobooke/src/common/model/naver_book_search_option.dart';
import 'package:gobooke/src/common/repository/naver_api_repository.dart';
import 'package:gobooke/src/splash/cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Dio dio = Dio(BaseOptions(baseUrl: 'https://openapi.naver.com/'));
  dio.interceptors.add(CustomInterceptor());
  runApp(MyApp(dio: dio));
}

class MyApp extends StatelessWidget {
  final Dio dio;
  const MyApp({super.key, required this.dio});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => NaverBookRepository(dio),
        )
      ], // App에서 사용되는 모든 repository 저장
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppDataLoadCubit(),
            lazy: false,
          ),
          BlocProvider(create: (context) => SplashCubit()),
        ],
        child: const App(),
      ),
    );
  }
}
