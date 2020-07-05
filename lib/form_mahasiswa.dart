import 'package:crud_sqflite/db_helper.dart';
import 'package:crud_sqflite/model/model_mahasiswa.dart';
import 'package:flutter/material.dart';


class FormMahasiswa extends StatefulWidget {
  final ModelMahasiswa modelMahasiswa;
  FormMahasiswa(this.modelMahasiswa);

  @override
  _FormMahasiswaState createState() => _FormMahasiswaState();
}

class _FormMahasiswaState extends State<FormMahasiswa> {
  DatabaseHelper db = new DatabaseHelper();
  TextEditingController _fullNameController;
  TextEditingController _emailController;
  TextEditingController _alamatController;
  TextEditingController _notelpController;
  TextEditingController _passworController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fullNameController = new TextEditingController(text: widget.modelMahasiswa.fullname);
    _alamatController = new TextEditingController(text: widget.modelMahasiswa.alamat);
    _notelpController = new TextEditingController(text: widget.modelMahasiswa.notelp);
    _emailController = new TextEditingController(text: widget.modelMahasiswa.email);
    _passworController = new TextEditingController(text: widget.modelMahasiswa.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Mahasiswa'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Text('Nama Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _fullNameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Alamat Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(
            height: 8,
          ),
          TextField(
            maxLines: 5,
            controller: _alamatController,
            decoration: InputDecoration(

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Nomor Telephone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _notelpController,
            decoration: InputDecoration(

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 8,
          ),
          Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          SizedBox(
            height: 8,
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
            color: Colors.orange,
            child: (widget.modelMahasiswa.id != null)
            ? Text('Update', style: TextStyle(color: Colors.white),)
                : Text('Add', style: TextStyle(color: Colors.white),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            onPressed: (){
              if(widget.modelMahasiswa.id != null){
                db.updateMahasiswa(ModelMahasiswa.fromMap({
                  'id' : widget.modelMahasiswa.id,
                  'fullname' : _fullNameController.text,
                  'alamat' : _alamatController.text,
                  'notelp' : _notelpController.text,
                  'email' : _emailController.text,
                  'password' : _passworController.text
                })).then((_){
                  Navigator.pop(context,'update');
                });
              }else {
                db.saveMahasiswa(ModelMahasiswa(
                  _fullNameController.text,
                  _alamatController.text,
                  _notelpController.text,
                  _emailController.text,
                  _passworController.text,
                )).then((_){
                  Navigator.pop(context,'save');
                });
              }
            },
          )
        ],
      ),
    );
  }
}
