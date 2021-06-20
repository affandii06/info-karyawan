import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infokaryawan/service/form.dart';
import 'package:infokaryawan/service/hitfirebase.dart';

class AlertInfo {

  DetailInfoKaryawan(BuildContext context, String key, String noinduk, String nama, String alamat, String ttl, String tanggalgabung, String sisacuti){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Detail Karyawan', style: GoogleFonts.poppins(),),
            content: Container(
              height: MediaQuery.of(context).size.height*0.35,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('No. Induk : ' + noinduk ),
                    SizedBox(height: 20,),
                    Text('Nama : ' + nama ),
                    SizedBox(height: 20,),
                    Text('Alamat : ' + alamat ),
                    SizedBox(height: 20,),
                    Text('TTL : ' + ttl ),
                    SizedBox(height: 20,),
                    Text('Tanggal Gabung : ' + tanggalgabung ),
                    SizedBox(height: 20,),
                    Text('Sisa Cuti : ' + sisacuti ),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Cancel'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
              RaisedButton(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Ambil Cuti'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    FormData().FormAddCutiKaryawan(context, key, noinduk, nama, sisacuti);
                  }
              ),
            ],
          );
        }
    );
  }

  DeleteDataKaryawan(BuildContext context, String nama, String key){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Anda akan menghapus data ' + nama + ' ?'),
          actions: [
            RaisedButton(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Cancel'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onPressed: (){
                  Navigator.pop(context);
                }
            ),
            RaisedButton(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Yes'),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onPressed: (){
                  HitFirebase().DeleteDataKaryawan(key);
                  Navigator.pop(context);
                }
            ),
          ],
        );
      }
    );
  }

  AlertFailedAddCuti(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Sisa Cuti Anda Tidak Cukup !'),
            actions: [
              RaisedButton(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Ok'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
            ],
          );
        }
    );
  }

  DetailInfoCutiKaryawan(BuildContext context, String key, String noinduk, String nama, String tanggacuti, String lamacuti, String keterangan){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Detail Cuti Karyawan', style: GoogleFonts.poppins(),),
            content: Container(
              height: MediaQuery.of(context).size.height*0.35,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('No. Induk : ' + noinduk ),
                    SizedBox(height: 20,),
                    Text('Nama : ' + nama ),
                    SizedBox(height: 20,),
                    Text('Tanggal Cuti : ' + tanggacuti ),
                    SizedBox(height: 20,),
                    Text('Lama Cuti : ' + lamacuti + ' hari' ),
                    SizedBox(height: 20,),
                    Text('Keterangan: ' + keterangan ),
                  ],
                ),
              ),
            ),
            actions: [
              RaisedButton(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Cancel'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
            ],
          );
        }
    );
  }

  DeleteDataCutiKaryawan(BuildContext context, String nama, String key){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Anda akan menghapus data cuti ' + nama + ' ?'),
            actions: [
              RaisedButton(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Cancel'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
              RaisedButton(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Yes'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    HitFirebase().DeleteDataCutiKaryawan(key);
                    Navigator.pop(context);
                  }
              ),
            ],
          );
        }
    );
  }
}