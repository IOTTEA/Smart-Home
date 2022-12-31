import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradutionproject/business-layer/bloc/cubit.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import 'package:gradutionproject/preseitation-layer/screens/homescreen.dart';
import 'package:gradutionproject/preseitation-layer/screens/safteyscreen.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BottomNaveScreen extends StatelessWidget {
 
 
  List<dynamic> screens = [
   
     HomeScreen(),
      SecurityScreen()];
 var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
  var time = DateFormat('KK:mm:ss a').format(DateTime.now());
     
IconData iconlight = Icons.light_mode_outlined;
IconData iconDark = Icons.dark_mode_outlined;

  Widget build(BuildContext context) {
    
    return SafeArea(
      child: BlocConsumer<iotCubit,iotStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
          body:SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: GoogleFonts.aclonica(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            )
                          ),
                           Text('${date}',style: GoogleFonts.aclonica(
                            fontSize: 20,
                              fontWeight: FontWeight.bold
                           ),),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                         iotCubit.get(context).Thememode();
                        },
                        icon: Icon(iotCubit.get(context).themmode ? iconDark : iconlight,),
                        iconSize: 35,
                      )
                    ],
                  ),
                ),
                 screens[iotCubit.get(context).curntscreen],
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: iotCubit.get(context).curntscreen,
            onTap: (index) {
              iotCubit.get(context).changebottomvav(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.security), label: 'Safety'),
            ],
          ),
        );
        },
      ),
    );
  }
}
