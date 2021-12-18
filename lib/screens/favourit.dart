import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/componant/componant.dart';
import 'package:shop_app/shop_cubit/cubit.dart';
import 'package:shop_app/shop_cubit/states.dart';
class FavoritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
   //      if(state is ShopSuccessChangeFavoritesState){
   //        if(state.model.status){
   // ShopCubit.get(context).getFavoritesData();
   //        }
   //      }
      },
      builder: (context, state)
      {

        return ConditionalBuilder(
          condition:
           state is! ShopLoadingGetFavoritesState,
          builder: (context) => ListView.separated(
  itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel.data.data[index]
      .product, context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
