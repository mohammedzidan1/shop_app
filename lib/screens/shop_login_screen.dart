import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/componant/componant.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/login_cubit/cubit.dart';
import 'package:shop_app/login_cubit/states.dart';
import 'package:shop_app/remotly/catch.dart';
import 'package:shop_app/screens/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ShopLoginCubit(),

      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state){

          if(state is ShopLoginSuccessState){
            if(state.loginModel.status){
              CacheHelper.saveData(
              key: 'token', value:state.loginModel.data.token ).then((value) {
              showToast(message: state.loginModel.message, color: Colors.green);
                navigateToReplace(context, ShopLayout());
            });


            }
            else{
              showToast(message: state.loginModel.message, color: Colors.red);


            }

          }
        },
          builder:(context,state)=>
         Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Login to browse our hot offers",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    defaultFormField(
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Please Enter your Email Address";
                          }
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
     suffixPressed: (){
   ShopLoginCubit.get(context).changePasswordVisibility();
 },
                        label: "Password",
                        isPassword: ShopLoginCubit.get(context).isPassword,
                        prefix: Icons.lock_outline,
                       suffix: ShopLoginCubit.get(context).suffix ,
                        type: TextInputType.visiblePassword,
                        controller: passwordController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "Password is short";
                          }
                        }),
                    SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState,
                      builder: (context) => defaultButton(
                        function: () {
                          ShopLoginCubit.get(context).userLogin(email: emailController.text,
                              password: passwordController.text);
                        },
                        text: "LOGIN",
                       // color: Colors.blue,
                      ),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        defaultTextButton(
                            function: () {
                              navigateTo(context, ShopRegisterScreen());
                            },
                            textIcon: "Register"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
