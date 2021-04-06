import 'package:flutter/material.dart';
import 'package:localization/localization_constant.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _mobile;
  String _password;
  void _submit() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    print("Name:$_name\nEmail:$_email\nMobile:$_mobile\nPassword:$_password");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page",style: TextStyle(fontSize: 20),),
      ),
    body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onSaved: (String val)
                  {
                    _name=val;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter Your  full name',
                    labelText: getTranslated(context, 'name_key')
                  ),
                  /*validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },*/
                  validator: (value)
                  {
                    if(value.length<3)
                      {
                       return 'Name must be three letter';

                      }
                    return null;
                },
                ),
                SizedBox( height: MediaQuery.of(context).size.width * 0.1,),
                TextFormField(
                  onSaved: (String val)
                  {
                    _email=val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Enter Your  Email',
                      labelText: getTranslated(context, 'email_key')
                  ),
                  validator: (value) {
                    if (value.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox( height: MediaQuery.of(context).size.width * 0.1,),
                TextFormField(
                  onSaved: (String val)
                  {
                    _mobile=val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Enter Phone Number',
                      labelText: getTranslated(context, 'phone_key')
                  ),
                  validator: (value) {
                    if (value.length !=10) {
                      return 'Mobile Number must be of 10 digit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  onSaved: (String val)
                  {
                    _password=val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Enter Passwod',
                      labelText: getTranslated(context, 'password_key')
                  ),
                  validator: (value) {
                    if (value.length< 4) {
                      return 'Password must be 4 digit';
                    }
                    return null;
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height *0.1,),
                Center(
                  child: RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 100.0,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                      ),
                    ),
                    onPressed: () => _submit(),
                  ),
                )
              ],
            )),
      ),
    ),
    );
  }
}
