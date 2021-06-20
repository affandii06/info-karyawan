import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:infokaryawan/service/alertdetailinfo.dart';
import 'dart:io';

import 'package:infokaryawan/widget/datakaryawan.dart';

class HitFirebase {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //data karyawan

  GetDataKaryawan(){
    try{
      return firestore.collection('DataKaryawan').orderBy('no_induk').snapshots();
    } catch(e){
      print(e);
    }
  }

  GetDataKaryawanPertama(){
    try{
      return firestore.collection('DataKaryawan').orderBy('tanggal_gabung').limit(3).snapshots();
    } catch(e){
      print(e);
    }
  }

  AddDataKaryawan(String noinduk, String nama, String alamat, String ttl, String tanggalgabung )async{
    try{
      await firestore.collection('DataKaryawan').add({
        'no_induk' : noinduk,
        'nama' : nama,
        'alamat' : alamat,
        'ttl' : ttl,
        'tanggal_gabung' : tanggalgabung,
        'sisa_cuti' : 12,
        'created_at' : FieldValue.serverTimestamp(),
        'update_at' : ''
      });
    } catch(e){
      print(e);
    }
  }

  UpdateDataKaryawan(String key, String noinduk, String nama, String alamat, String ttl, String tanggalgabung) async {
    try{
      await firestore.collection('DataKaryawan').doc(key).update({
        'no_induk' : noinduk,
        'nama' : nama,
        'alamat' : alamat,
        'ttl' : ttl,
        'tanggal_gabung' : tanggalgabung,
        'sisa_cuti' : 12,
        'updated_at' : FieldValue.serverTimestamp(),
      });
    }catch(e){
      print(e);
    }
  }

  DeleteDataKaryawan(String key) async {
    try {
      await firestore.collection('DataKaryawan').doc(key).delete();
    }catch(e){
      print(e);
    }
  }

  //data cuti

  GetDataCutiKaryawan(){
    try{
      return firestore.collection('DataCutiKaryawan').orderBy('tanggal_cuti').snapshots();
    } catch(e){
      print(e);
    }
  }

  GetDataCutiKaryawanTanggalSekarang(){
    try{
      return firestore.collection('DataCutiKaryawan').where('tanggal_cuti', isEqualTo: DateTime.now().toString().substring(0,10)).snapshots();
    } catch(e){
      print(e);
    }
  }

  AddDataCutiKaryawan(BuildContext context, String key, String noinduk, String nama, String sisacuti, String tanggalcuti, String lamacuti, String keterangan )async{
    if(int.parse(sisacuti) - int.parse(lamacuti) >= 0) {
      try {
        await firestore.collection('DataCutiKaryawan').add({
          'no_induk': noinduk,
          'nama': nama,
          'tanggal_cuti': tanggalcuti,
          'lama_cuti': int.parse(lamacuti),
          'keterangan': keterangan,
          'created_at': FieldValue.serverTimestamp(),
          'updated_at': ''
        });

        await firestore.collection('DataKaryawan').doc(key).update({
          'sisa_cuti' : int.parse(sisacuti) - int.parse(lamacuti)
        });
      } catch (e) {
        print(e);
      }
    }else{
      AlertInfo().AlertFailedAddCuti(context);
    }
  }

  DeleteDataCutiKaryawan(String key) async {
    try {
      await firestore.collection('DataCutiKaryawan').doc(key).delete();
    }catch(e){
      print(e);
    }
  }
}