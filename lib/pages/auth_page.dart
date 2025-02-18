
import 'package:flutter/material.dart';
import 'package:flutter_app_login/provider/page_notifier.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page{

  static final pageName = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context)=>AuthWidget());
  }

}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  static final double cornerRadius = 8.0;

  OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(cornerRadius),
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage('assets/image.gif')
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    SizedBox(
                        height: 16
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 36,
                      child: Text("LogIn"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildTextFormField("Email Address", _emailController),
                    SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField("Password", _passwordController),
                    SizedBox(
                      height: 8,
                    ),
                    _buildTextFormField("Confirm Password", _confirmPasswordController),
                    SizedBox(
                      height: 16,
                    ),
                    FlatButton(
                      onPressed: (){

                        if(_formKey.currentState.validate()) {
                          print('모든 입력값이 올바르구나!!');
                        }


                      },
                      color: Colors.white54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(cornerRadius)
                      ),
                      padding: EdgeInsets.all(16),
                      child: Text("Login"),
                    )
                  ],
                ),
              ),
            ),
        ),
        ),
      );
  }

  TextFormField _buildTextFormField(String labelText, TextEditingController controller) {
    return TextFormField(
                    cursorColor: Colors.white,
                    controller: controller,
                    validator: (text){
                      if(text == null || text.isEmpty) {
                        return "입력창이 비어있어요!";
                      }

                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: labelText,
                      filled: true,
                      fillColor: Colors.black45,
                      border: _border,
                      errorBorder: _border.copyWith(borderSide: BorderSide(color: Colors.black, width: 3)),
                      enabledBorder: _border,
                      focusedBorder: _border,
                      errorStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  );
  }
}
