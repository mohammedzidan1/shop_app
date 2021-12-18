import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/componant/componant.dart';
import 'package:shop_app/componant/constant.dart';
import 'package:shop_app/login_cubit/cubit.dart';
import 'package:shop_app/login_cubit/states.dart';
import 'package:shop_app/screens/searsh.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopCubit, ShopStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ShopCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: Text("Salla"),
                  actions: [

                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        navigateTo(context,
                            SearchScreen());
                      }
                    ),
                    // IconButton(icon:Icon( Icons.fourteen_mp), onPressed: (){
                    //   signOut(context);})
                  ],
                ),
                //  defaultTextButton(textIcon: 'Log Out', function: (){}),
                body: cubit.screens[cubit.currentIndex],
                // defaultTextButton(
                //            function: (){}
                //
                //        ,textIcon: 'SIGN OUT'),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomNavigatorItem(index);
                  },
                  items: ShopCubit.get(context).bottomItems,
                ),
              );
            }

    );
  }
}
