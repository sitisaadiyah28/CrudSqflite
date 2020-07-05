import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud_sqflite/DetailPage.dart';
import 'package:crud_sqflite/db_helper.dart';
import 'package:crud_sqflite/form_mahasiswa.dart';
import 'package:crud_sqflite/model/model_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';

class ListMahasiswa extends StatefulWidget {
  @override
  _ListMahasiswaState createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {
  List<ModelMahasiswa> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getAllMahasiswa().then((mahasiswas) {
      setState(() {
        mahasiswas.forEach((mahasiswa) {
          items.add(ModelMahasiswa.fromMap(mahasiswa));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEKNOLOGI INFORMASI PNP'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Carousel(
              autoplay: true,
              indicatorBgPadding: 8.0,
              images: [
                AssetImage('images/pp2.jpg'),
                AssetImage('images/pp.jpg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                'LIST MAHASISWA TEKNOLOGI INFORMASI',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height ,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        '${items[index].fullname}',
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${items[index].email}',
                      ),
                      onTap: () {
                        _navigateToMahasiswa(context, items[index]);
                      },
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          AlertDialog hapus = AlertDialog(
                            title: Text('Information'),
                            content: Container(
                              height: 80,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'Apakah Anda yakin ingin menghapus data ${items[index].fullname}')
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  _deleteMahasiswa(
                                      context, items[index], index);
                                  Navigator.pop(context);
                                },
                              ),
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                          showDialog(context: context, child: hapus);
                        },
                      ),
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageDetail(
                                        nama: items[index].fullname,
                                        alamat: items[index].alamat,
                                        notelp: items[index].notelp,
                                        email: items[index].email,
                                      )));
                        },
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        ),
                      ),
                    ),

                  );

                },
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
        onPressed: () {
          _createNewMahasiswa(context);
        },
      ),
    );
  }

  _deleteMahasiswa(
      BuildContext context, ModelMahasiswa mahasiswa, int position) {
    db.deleteMahasiswa(mahasiswa.id).then((mahasiswas) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToMahasiswa(
      BuildContext context, ModelMahasiswa mahasiswa) async {
    String result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormMahasiswa(mahasiswa)));
    if (result == 'update') {
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

  void _createNewMahasiswa(BuildContext context) async {
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FormMahasiswa(ModelMahasiswa('', '', '', '',''))));
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
