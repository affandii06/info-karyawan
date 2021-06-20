import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infokaryawan/service/hitfirebase.dart';

class FormData {

  final _keyform = GlobalKey<FormState>();
  TextEditingController cNoinduk = TextEditingController();
  TextEditingController cNama = TextEditingController();
  TextEditingController cAlamat = TextEditingController();
  String sNoinduk;
  String sNama;
  String sAlamat;
  String sTtl;
  String sTanggalgabung;

  FormAddDataKaryawan(context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Isi Data Karyawan', style: GoogleFonts.poppins(),),
            content: Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: Form(
                key: _keyform,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cNoinduk,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Harap isi Form ini';
                          }
                          return null;
                        },
                        onSaved: (value)=>sNoinduk = cNoinduk.text,
                        decoration: InputDecoration(
                            labelText: 'No Induk Karyawan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        style: GoogleFonts.roboto(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        controller: cNama,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Harap isi Form ini';
                          }
                          return null;
                        },
                        onSaved: (value)=>sNama = cNama.text,
                        decoration: InputDecoration(
                            labelText: 'Nama Karyawan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        style: GoogleFonts.roboto(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        maxLines: 3,
                        controller: cAlamat,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Harap isi Form ini';
                          }
                          return null;
                        },
                        onSaved: (value)=>sAlamat = cAlamat.text,
                        decoration: InputDecoration(
                            labelText: 'Alamat Karyawan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        style: GoogleFonts.roboto(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),

                      SizedBox(height: 20,),
                      Container(
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            dateMask: 'd MMM, yyyy',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Pilih Tanggal Lahir',
                            onChanged: (val)=> sTtl = (val),
                          )
                      ),

                      SizedBox(height: 20,),
                      Container(
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'd MMM, yyyy',
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Pilih Tanggal Gabung',
                          onChanged: (val)=> sTanggalgabung = (val),
                        )
                      ),
                    ],
                  ),
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
                    cNoinduk.clear();
                    cNama.clear();
                    cAlamat.clear();
                    Navigator.pop(context);
                  }
              ),

              RaisedButton(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    final form = _keyform.currentState;
                    if(form.validate() && sTtl != null && sTanggalgabung != null){
                      form.save();
                      HitFirebase().AddDataKaryawan(sNoinduk, sNama, sAlamat, sTtl, sTanggalgabung);
                      cNoinduk.clear();
                      cNama.clear();
                      cAlamat.clear();
                      Navigator.pop(context);
                    }
                  }
              ),
            ],
          );
        }
    );
  }

  TextEditingController cNoindukupdate = TextEditingController();
  TextEditingController cNamaupdate = TextEditingController();
  TextEditingController cAlamatupdate = TextEditingController();
  String sNoindukupdate;
  String sNamaupdate;
  String sAlamatupdate;
  String sTtlupdate;
  String sTanggalgabungupdate;

  FormUpdateDataKaryawan(context, String key, String noinduk, String nama, String alamat, String ttl, String tanggalgabung){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Update Data ' + nama, style: GoogleFonts.poppins(),),
            content: Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: cNoindukupdate,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Harap isi Form ini';
                        }
                        return null;
                      },
                      onSaved: (value)=>sNoindukupdate = cNoindukupdate.text,
                      decoration: InputDecoration(
                          helperText: 'No. Induk Karyawan',
                          hintText: noinduk,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      style: GoogleFonts.roboto(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                    SizedBox(height: 20,),
                    TextFormField(
                      controller: cNamaupdate,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Harap isi Form ini';
                        }
                        return null;
                      },
                      onSaved: (value)=>sNamaupdate = cNamaupdate.text,
                      decoration: InputDecoration(
                          helperText: 'Nama Karyawan',
                          hintText: nama,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      style: GoogleFonts.roboto(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                    SizedBox(height: 20,),
                    TextFormField(
                      maxLines: 3,
                      controller: cAlamatupdate,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Harap isi Form ini';
                        }
                        return null;
                      },
                      onSaved: (value)=>sAlamatupdate = cAlamatupdate.text,
                      decoration: InputDecoration(
                          helperText: 'Alamat Karyawan',
                          hintText: alamat,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)
                          )
                      ),
                      style: GoogleFonts.roboto(fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                    SizedBox(height: 20,),
                    Container(
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'd MMM, yyyy',
                          initialValue: ttl,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'Pilih Tanggal Lahir',
                          onChanged: (val)=> sTtlupdate = (val),
                        )
                    ),

                    SizedBox(height: 20,),
                    Container(
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: tanggalgabung,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        icon: Icon(Icons.event),
                        dateLabelText: 'Pilih Tanggal Lahir',
                        onChanged: (val)=> sTanggalgabungupdate = (val),
                      )
                    ),
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
                    cNoindukupdate.clear();
                    cNamaupdate.clear();
                    cAlamatupdate.clear();
                    Navigator.pop(context);
                  }
              ),

              RaisedButton(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    HitFirebase().UpdateDataKaryawan(
                        key,
                        cNoindukupdate.text == '' ? noinduk : cNoindukupdate.text,
                        cNamaupdate.text == '' ? nama : cNamaupdate.text,
                        cAlamatupdate.text == '' ? alamat : cAlamatupdate.text,
                        sTtlupdate == null ? ttl : sTtlupdate,
                        sTanggalgabungupdate == null ? tanggalgabung : sTanggalgabungupdate
                    );
                    cNoindukupdate.clear();
                    cNamaupdate.clear();
                    cAlamatupdate.clear();
                    Navigator.pop(context);
                  }
              ),
            ],
          );
        }
    );
  }

  final _keycuti = GlobalKey<FormState>();
  TextEditingController cLamacuti = TextEditingController();
  TextEditingController cKeterangan = TextEditingController();
  String sTanggacuti;
  String sLamacuti;
  String sKeterangan;

  FormAddCutiKaryawan(context, String key, String noinduk, String nama, String sisacuti,){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Isi Data Cuti', style: GoogleFonts.poppins(),),
            content: Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: Form(
                key: _keyform,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            dateMask: 'd MMM, yyyy',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Pilih Tanggal Mulai Cuti',
                            onChanged: (val)=> sTanggacuti = (val),
                          )
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        controller: cLamacuti,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Harap isi Form ini';
                          }
                          return null;
                        },
                        onSaved: (value)=>sLamacuti = cLamacuti.text,
                        decoration: InputDecoration(
                            labelText: 'Lama Cuti',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        style: GoogleFonts.roboto(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        keyboardType: TextInputType.number,
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        maxLines: 3,
                        controller: cKeterangan,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Harap isi Form ini';
                          }
                          return null;
                        },
                        onSaved: (value)=>sKeterangan = cKeterangan.text,
                        decoration: InputDecoration(
                            labelText: 'Keterangan',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                        style: GoogleFonts.roboto(fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
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
                    cLamacuti.clear();
                    cKeterangan.clear();
                    Navigator.pop(context);
                  }
              ),

              RaisedButton(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    final form = _keyform.currentState;
                    if(form.validate() && sTanggacuti != null){
                      form.save();
                      Navigator.pop(context);
                      HitFirebase().AddDataCutiKaryawan(context, key , noinduk, nama, sisacuti, sTanggacuti, sLamacuti, sKeterangan);
                      cLamacuti.clear();
                      cKeterangan.clear();
                    }
                  }
              ),
            ],
          );
        }
    );
  }
}