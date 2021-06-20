import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infokaryawan/service/alertdetailinfo.dart';
import 'package:infokaryawan/service/hitfirebase.dart';

class DataCuti extends StatefulWidget {
  @override
  _DataCutiState createState() => _DataCutiState();
}

class _DataCutiState extends State<DataCuti> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: StreamBuilder<QuerySnapshot>(
        stream: HitFirebase().GetDataCutiKaryawan(),
        builder: (_, snapshot){
          if(snapshot.hasData){
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
                        height: 100,
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
                                    Text('No. Induk : ' + e.data()['no_induk']),
                                    Text('Tanggal Cuti : ' + e.data()['tanggal_cuti']),
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
                                        icon: Icon(
                                          Icons.delete, color: Colors.red,),
                                        onPressed: () {
                                          AlertInfo().DeleteDataCutiKaryawan(context, e.data()['nama'], e.reference.id);
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
                    onTap: (){
                      AlertInfo().DetailInfoCutiKaryawan(context, e.reference.id, e.data()['no_induk'], e.data()['nama'], e.data()['tanggal_cuti'], e.data()['lama_cuti'].toString(), e.data()['keterangan']);
                    },
                  )
                ).toList(),
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}
