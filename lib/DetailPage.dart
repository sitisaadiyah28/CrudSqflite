import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {

  String nama, alamat, email, notelp;
  PageDetail({this.nama, this.alamat, this.notelp, this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width/1.1,
            child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text('DETAIL MAHASISWA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Nama Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text('$nama', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Alamat Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text('$alamat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Nomor Telephone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      height: 50,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text('$notelp', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                      height: 50,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text('$email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),),
                      )
                  ),

                ],
              ),
          ),
      ),
    );
  }
}
