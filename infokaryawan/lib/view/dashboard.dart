import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infokaryawan/widget/cutihariini.dart';
import 'package:infokaryawan/widget/datacuti.dart';
import 'package:infokaryawan/widget/datakaryawan.dart';
import 'package:infokaryawan/widget/karyawanpertama.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Data Info Karyawan', style: GoogleFonts.poppins(color: Colors.white),),
          elevation: 0,
          bottom: TabBar(
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
              ),
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.white,
              tabs:[
                Tab(child: Text('Data Karyawan')),
                Tab(child: Text('Data 3 Karyawan Pertama')),
                Tab(child: Text('Data Cuti')),
                Tab(child: Text('Data Cuti Hari Ini')),
              ],
            isScrollable: true,
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            DataKaryawan(),
            DataKaryawanPertama(),
            DataCuti(),
            CutiHariini(),
          ],
        )
      ),
    );
  }
}
