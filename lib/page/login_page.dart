import 'package:flutter/material.dart';
import 'package:recipes_app/service/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

  // FORM CHUA TOAN BO DANG NHAP
class _LoginPageState extends State<LoginPage>{
  GlobalKey<FormState>_LoginFormKey=GlobalKey();
  String? username,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title:Text("LOGIN",),
      ),
      body:SafeArea(child: _buildUI()),
    );
  }

  //FORM DANG NHAP
  Widget _buildUI(){
    return SizedBox(
      width:MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  //TEN(RECIPIES BOOK)
  Widget _title(){
    return Text("RECIPIES BOOK",
    style: TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w500
      ),);
  }

//FORM-LOGIN
  Widget _loginForm(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Form(
        key: _LoginFormKey,
        child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //user
          TextFormField(
            initialValue: 'ducthang2802',
            onSaved: (value){
             setState(() {
                username =value ;
             });

            },
            validator: (value){
              if(value==null||value.isEmpty){
                return "User is empty";
              }
            },
           
            decoration: InputDecoration(
              hintText: "User Name",
            ),
          ),

          //password
          TextFormField(
            initialValue: 'ducthang',
                  onSaved: (value){
             setState(() {
                password =value ;
             });

            },
              validator: (value){
              if(value==null||value.length<5){
                return "User is value password";
              }
            },
             obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          // NUT BUTTON
          _ButtonLogin(),
        ],
      ),),
    );
  }

//BUTTON_LOGIN
  Widget _ButtonLogin(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width*0.60,
      child: ElevatedButton(onPressed:()async{
        if(_LoginFormKey.currentState?.validate()??false){
          _LoginFormKey.currentState?.save();
          bool result =await AuthService().login(
            username!, password!,
            );
            // print(result);
          if(result){
            Navigator.pushReplacementNamed(context, "/home");
          }else{
            StatusAlert.show(context,duration: const Duration(seconds: 2),
            title: 'Login Fail',
                subtitle: 'please try again',
              configuration: const IconConfiguration(
                icon: Icons.error,
              ),
              maxWidth: 200
            );
          }
        }
      },

      child: const Text(
        "LOGIN"
      ),),
    );
  }
}