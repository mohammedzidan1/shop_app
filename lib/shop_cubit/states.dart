import 'package:shop_app/models/change_favorites_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/login_model.dart';

abstract class ShopStates{}
class ShopInitialState extends ShopStates{}

class ChangeBottomNavigatorItemState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class  ShopSuccessHomeDataState  extends ShopStates{}
class  ShopErrorHomeDataState  extends ShopStates{}
class  ShopSuccessCategoriesDataState  extends ShopStates{}
class  ShopErrorCategoriesDataState  extends ShopStates{}
class ShopLoadingCategoriesDataState  extends ShopStates{}

class ShopSuccessChangeState extends ShopStates{}
class  ShopSuccessChangeFavoritesState  extends ShopStates{
  final ChangeFavoritesModel model;

  ShopSuccessChangeFavoritesState (this.model);
}
class  ShopErrorChangeFavoritesState   extends ShopStates{}
class  ShopSuccessFavoritesState  extends ShopStates{}

class  ShopErrorFavoritesState   extends ShopStates{}
class  ShopLoadingGetFavoritesState   extends ShopStates{}
class  ShopSuccessUserDataState  extends ShopStates{}

class  ShopErrorUserDataState   extends ShopStates{}
class  ShopLoadingUserDataState   extends ShopStates{}
class ShopLoadingUpdateDataState extends ShopStates{}
class  ShopSuccessUpdateDataState  extends ShopStates{
  final ShopLoginModel model;

  ShopSuccessUpdateDataState(this.model);
}
class  ShopErrorUpdateDataState  extends ShopStates{}
