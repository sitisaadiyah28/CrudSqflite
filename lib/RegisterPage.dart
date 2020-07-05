
import 'package:crud_sqflite/LoginPage.dart';
import 'package:crud_sqflite/db_helper.dart';
import 'package:crud_sqflite/model/model_mahasiswa.dart';
import 'package:crud_sqflite/model/model_user.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final ModelMahasiswa modelMahasiswa;
  RegisterPage(this.modelMahasiswa);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  DatabaseHelper db = new DatabaseHelper();
  TextEditingController _fullNameController;
  TextEditingController _emailController;
  TextEditingController _alamatController;
  TextEditingController _notelpController;
  TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameController = new TextEditingController(text: widget.modelMahasiswa.fullname);
    _alamatController = new TextEditingController(text: widget.modelMahasiswa.alamat);
    _notelpController = new TextEditingController(text: widget.modelMahasiswa.notelp);
    _emailController = new TextEditingController(text: widget.modelMahasiswa.email);
    _passwordController= new TextEditingController(text: widget.modelMahasiswa.password);
  }

  void _tampilkanalert() {
    AlertDialog alertDialog = new AlertDialog(
        content: new Container(
          height: 100.0,
          child: new Center(
            child: Column(
              children: <Widget>[
                Text("Selamat Anda Berhasil!!"),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white ),),
                    onPressed: (){
                      db.saveMahasiswa(ModelMahasiswa(
                          _fullNameController.text,
                          _alamatController.text,
                          _notelpController.text,
                          _emailController.text,
                          _passwordController.text
                      )).then((_){
                        Navigator.pop(context,'save');
                      });
                    },
                  ),
                )
              ],

            ),
          ),
        )
    );
    showDialog(context: context, child: alertDialog);
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
              'FORM REGISTER MAHASISWA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 60),
            child: Text(
              'Nama Mahasiswa',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                  hintText: "Nama Mahasiswa",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0)
                  )
              ),
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
              controller: _emailController,
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
              'Alamat',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextFormField(
              controller: _alamatController,
              maxLines: 6,
              decoration: InputDecoration(
                  hintText: "Alamat Mahasiswa",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'No Telp',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
            child: TextFormField(
              controller: _notelpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Nomor Telp",
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
              controller: _passwordController,
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
                    db.saveMahasiswa(ModelMahasiswa(
                        _fullNameController.text,
                        _alamatController.text,
                        _notelpController.text,
                        _emailController.text,
                        _passwordController.text
                    )).then((_){
                      Navigator.pop(context,'save');
                    });
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

