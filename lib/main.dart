import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/remotly/bloc_observer.dart';
import 'package:shop_app/remotly/catch.dart';
import 'package:shop_app/remotly/dio.dart';
import 'package:shop_app/screens/shop_login_screen.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';
import 'package:shop_app/style/themes.dart';

import 'componant/constant.dart';
import 'on_bording/on_bording.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    MyApp(
      startWidget: widget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopCubit()
          ..getHomeData()
          ..getCategoriesData()
          ..getFavoritesData()
          ..getUserData(),
        child: BlocConsumer<ShopCubit, ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                //   darkTheme: darkTheme,
                themeMode: ThemeMode.light,
                home:startWidget

            );
          },
        ));
  }
}
