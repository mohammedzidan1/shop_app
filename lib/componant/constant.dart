
import 'package:shop_app/componant/componant.dart';
import 'package:shop_app/remotly/catch.dart';
import 'package:shop_app/screens/shop_login_screen.dart';


void signOut(context)
{

  CacheHelper.removeData(
    key: 'token',
  ).then((value)
  {
    if (value)
    {
      navigateToReplace(
        context,
        ShopLoginScreen(),
      );
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';