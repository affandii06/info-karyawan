import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infokaryawan/service/alertdetailinfo.dart';
import 'package:infokaryawan/service/form.dart';
import 'package:infokaryawan/service/hitfirebase.dart';

class DataKaryawanPertama extends StatefulWidget {
  @override
  _DataKaryawanPertamaState createState() => _DataKaryawanPertamaState();
}

class _DataKaryawanPertamaState extends State<DataKaryawanPertama> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
            stream: HitFirebase().GetDataKaryawanPertama(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: snapshot.data.docs.map((e) =>
                        InkWell(
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.4,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('Nama : ' + e.data()['nama']),
                                          Text('No. Induk : ' +
                                              e.data()['no_induk']),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          IconButton(
                                              icon: Icon(Icons.edit_road,
                                                color: Colors.amber,),
                                              onPressed: () {
                                                FormData().FormUpdateDataKaryawan(context, e.reference.id, e.data()['no_induk'], e.data()['nama'], e.data()['alamat'], e.data()['ttl'], e.data()['tanggal_gabung']);
                                              }
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.delete, color: Colors.red,),
                                              onPressed: () {
                                                AlertInfo().DeleteDataKaryawan(context, e.data()['nama'], e.reference.id);
                                              }
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            AlertInfo().DetailInfoKaryawan(
                                context,
                                e.reference.id,
                                e.data()['no_induk'], e.data()['nama'],
                                e.data()['alamat'], e.data()['ttl'],
                                e.data()['tanggal_gabung'],
                                e.data()['sisa_cuti'].toString()
                            );
                          },
                        )
                    ).toList(),
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
            }
        )
    );
  }
}
