import 'package:crud_sqflite/RegisterPage.dart';
import 'package:crud_sqflite/db_helper.dart';
import 'package:crud_sqflite/list_mahasiswa.dart';
import 'package:crud_sqflite/model/model_mahasiswa.dart';
import 'package:crud_sqflite/model/model_user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  List<ModelMahasiswa> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();


  void onValidate()async {
    if (etEmail.text.isEmpty || etPassword.text.isEmpty) {
      print("Gagal");
    } else {
      if(items.length >0){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ListMahasiswa()
        ));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image(image: AssetImage("images/pnp.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              'FORM LOGIN MAHASISWA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'Email',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextFormField(
              controller: etEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0)
                  )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'Password',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: TextFormField(
              controller: etPassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/14,
                child: RaisedButton(
                  color: Colors.orange,
                  onPressed: () {
                    onValidate();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: (){
                _createNewMahasiswa(context);
            },
            child: Text('Register', style: TextStyle(fontSize: 18.0,),),
          )
        ],
      ),
    );
  }

  void _createNewMahasiswa(BuildContext context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RegisterPage(ModelMahasiswa('', '', '', '',''))));
    if (result == 'save') {
      db.getAllMahasiswa().then((mahasiswas) {
        setState(() {
          items.clear();
          mahasiswas.forEach((mahasiswa) {
            items.add(ModelMahasiswa.fromMap(mahasiswa));
          });
        });
      });
    }
  }


}


