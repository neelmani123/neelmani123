import 'package:flutter/material.dart';
import 'package:localization/language.dart';
import 'package:localization/localization_constant.dart';
import 'package:localization/main.dart';
import 'package:localization/signUp.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _changeLanguage(Language language)
  {
    Locale _temp;
    switch(language.languageCode){
      case 'en':
        _temp=Locale(language.languageCode,'US');
        break;
      case 'hi':
        _temp=Locale(language.languageCode,'IN');
        break;
      default :
        _temp=Locale(language.languageCode,'US');
    }
    MyApp.setLocale(context,_temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(getTranslated(context,'drawer_head')),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(getTranslated(context,'item_one')),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(getTranslated(context,'item_two')),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text(getTranslated(context,'item_three')),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(getTranslated(context,'home_page')),
        actions: [
          Padding(
              padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language)
              {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(Icons.language,color: Colors.white,),
              items: Language.languageList()
              .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                value: lang,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(lang.flag),
                      Text(lang.name)
                    ],
                  ))).toList(),
            ),
          )
        ],
      ),
      body: ListView(
       children: [
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(height: 20,),
             Text(getTranslated(context,'personal_info')),
             SizedBox(height: 20,),
             TextFormField(
               decoration: InputDecoration(
                 labelText: getTranslated(context, 'name_key')
               ),
             ),
             TextFormField(
               decoration: InputDecoration(
                   labelText: getTranslated(context, 'email_key')
               ),
             ),
             TextFormField(
               decoration: InputDecoration(
                   labelText: getTranslated(context, 'pass_key')
               ),
             ),
             SizedBox(
               height: 50,
             ),
//Add One Line
             Container(
               width: MediaQuery.of(context).size.width,
               height: 50,
               child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: 40),
                 child: RaisedButton(
                   color: Colors.blue,
                     onPressed: (){},
                 child: Text(getTranslated(context, 'submit_key'),style: TextStyle(fontSize: 18,color: Colors.white),),),
               ),
             ),
             SizedBox(height: 20,),
             Container(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text(getTranslated(context, 'forgot_password'),style: TextStyle(fontSize: 18,color: Colors.blue),)
                 ],
               ),
             ),
             SizedBox(height: 30,),
             Container(
               width: MediaQuery.of(context).size.width/2,
               child: OutlineButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                 },
                 child: Text(getTranslated(context, 'sign_up'), style: TextStyle(fontSize: 18.0,color: Colors.blue),),
                 highlightedBorderColor: Colors.red,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)),
               ),
             )
           ],
         )
       ],
      ),
    );
  }
}
