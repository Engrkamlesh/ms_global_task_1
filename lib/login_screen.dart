import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ms_global_task_1/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool showpassword = true;

  void login()async{
    var url = 'https://jsonplaceholder.typicode.com/users';
    var data = {
      'username': emailcontroller.text,
      'username': passwordcontroller.text,
    };
    var vbody = jsonEncode(data);
    var urlParse = Uri.parse(url);
    Response response = await http.post(
      urlParse,
      body: vbody,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
    print(response.body);
  }

// void login(String email, password) async{
//   try{
//     Response response =await post(Uri.parse('https://jsonplaceholder.typicode.com/users'),
//       body:{
//         'username' : email,
//         'username': password,
//       }
//     );
//     if(response.statusCode ==200){
//       Utils().ToastMassage('Successfully Login');
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
//
//     }else{
//       print('failed');
//       Utils().ToastMassage('Failed');
//     }
//   }catch(e){
//     Utils().ToastMassage(e.toString());
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child:Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/img.jpg',
              height: 150,
              width: 150,
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: emailcontroller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffeeeeee),
                hintText: 'Email',
                border: InputBorder.none),
          ),
          SizedBox(height: 30),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordcontroller,
            obscureText: showpassword,
            decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Color(0xffeeeeee),
                suffixIcon:IconButton(onPressed: (){
                  setState(() {
                    showpassword = !showpassword;
                  });
                }, icon: Icon(showpassword ? Icons.visibility_off : Icons.visibility)),

                border: InputBorder.none),
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: (){
              login();
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
            },
            child:Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red
              ),
              child: Center(child: Text('LOGIN',style: TextStyle(fontSize: 20,color: Colors.white),),),
            ),
          )
        ],
      ),
        )
        )
    );
  }
}
