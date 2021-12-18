import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/componant/constant.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/remotly/dio.dart';
import 'package:shop_app/screens/catigores.dart';
import 'package:shop_app/screens/favourit.dart';
import 'package:shop_app/screens/product.dart';
import 'package:shop_app/screens/settings.dart';
import 'package:shop_app/shop_cubit/states.dart';
class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.apps), label: "category"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
  ];
  List<Widget> screens = [
    ProductScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;
  HomeModel homeModel;
  ShopLoginModel userModel;
  CategoriesModel categoriesModel;
  void changeBottomNavigatorItem(index) {
    currentIndex = index;
    emit(ChangeBottomNavigatorItemState());
  }
  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel.data.banners[0].image);
      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());
      emit(ShopErrorHomeDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  void getCategoriesData() {
    emit(ShopLoadingCategoriesDataState());
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesDataState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorCategoriesDataState());
    });
  }

  Map<int, bool> favorites = {};

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUserDataState());
    }).catchError((onError) {
      emit(ShopErrorUserDataState());
    });
  }


  FavoritesModel favoritesModel;
  ChangeFavoritesModel changeModel;


  void changeFavorites(int favoritesId) {
    favorites[favoritesId] = !favorites[favoritesId];
    emit(ShopSuccessChangeState());
    DioHelper.postData(
            url: FAVORITES, data: {'product_id': favoritesId}, token: token)
        .then((value) {
      changeModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (!changeModel.status) {
        favorites[favoritesId] = !favorites[favoritesId];
      } else {
        getFavoritesData();

        }
      emit(ShopSuccessChangeFavoritesState(changeModel));
    }).catchError((onError) {
      emit(ShopErrorChangeFavoritesState());
    });
  }

  void getFavoritesData() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
            url: FAVORITES,
            token: token
              )
        .then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(ShopSuccessFavoritesState());
    }).catchError((onError) {
      emit(ShopErrorFavoritesState());
    });
  }
  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(ShopLoadingUpdateDataState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: "xPw42I8dw8pvGwyIBg8iW8j06JFiJ5BdXSOrvxb03OSDNVh56wiGDgVnYAmcZS7ehjFGdx",
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessUpdateDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateDataState());
    });
  }
}


