import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradutionproject/business-layer/bloc/statas.dart';
import 'package:gradutionproject/data-layer/shardprefresnses/shardprefrenses.dart';


class iotCubit extends Cubit<iotStates>{
  iotCubit() :super(iotInitialState());

  static iotCubit get(context) => BlocProvider.of(context);

  final ref = FirebaseDatabase.instance.ref().child("DHT11part1");
  final ref2 = FirebaseDatabase.instance.ref().child("DHT11part2");


   int curntscreen = 0;
   void changebottomvav(index){
    curntscreen = index;
    emit(changebottomvavState());
   }

  int curntindex = 0;
  void changepages(index){
  curntindex = index;
  emit(changepagesState());
  }

bool themmode = true;
void Thememode({bool? isDark}){
  if(isDark!=null)
  themmode=isDark;
  else
  themmode = !themmode;
  ChachHelper.putData(key: "isDark",value: themmode);
  emit(changethemmodeState());
}
 
//  bool ? lamp1state= false;
//   void onofflamp1(){
  //   lamp1state != lamp1state;
  // }

bool lamp1 = true;
void Lamp1State({bool? fromshard}){
  if(fromshard!=null)
  lamp1=fromshard;
  else
  lamp1 = !lamp1;
  ChachHelper.putData(key: "lamp1state", value: lamp1);
  
   emit(lamp1State());
}

bool lamp2 = true;
void Lamp2state({bool? fromshard}){
  if(fromshard!=null)
   lamp2=fromshard;
  else
  lamp2 =! lamp2;
  ChachHelper.putData(key: "lamp2State", value: lamp2);
  emit(lamp2State());
}




bool fan = true;
void Fanstate({bool? fromshard}){
 
  if(fromshard!=null)
   fan=fromshard;
  else
  fan = !fan;
  ChachHelper.putData(key: "fanState", value: fan);
  emit(fanState());
}

bool door = true;
void Doorstate({bool? fromshard}){
  if(fromshard!=null)
   door=fromshard;
  else
  door = !door;
  ChachHelper.putData(key: "doorState", value: door);
  emit(doorState());
}

bool wendo = true;
void Wendostate({bool? fromshard}){
  if(fromshard!=null)
   wendo=fromshard;
  else
  wendo = !wendo;
  ChachHelper.putData(key: "wendoState", value: wendo);
  emit(wendoState());
}

bool garagedoor = true;
void GarageDoor({bool? GarageDoorState}){
  if(GarageDoorState!=null)
  garagedoor=GarageDoorState;
  else
  garagedoor=!garagedoor;
  ChachHelper.putData(key: "GarageDoorState",value: garagedoor);
  emit(garageLampState());
}

bool garagelamp = true;
void GarageLamp({bool? GarageLampState}){
  if(GarageLampState!=null)
  garagelamp=GarageLampState;
  else
  garagelamp=!garagelamp;
  ChachHelper.putData(key: "GarageLampState",value: garagelamp);
  emit(garageLampState());
}

bool gardencover = true;
void Gardencover({bool? gardencoverstate}){
  if(gardencoverstate!=null)
  gardencover=gardencoverstate;
  else
  gardencover=!gardencover;
  ChachHelper.putData(key: "gardencoverstate",value: gardencover);
  emit(CovergardenState());
}

bool gardenlamp = true;
void GardenLamp({bool? GardenLampState}){
  if(GardenLampState!=null)
  gardenlamp=GardenLampState;
  else
  gardenlamp=!gardenlamp;
  ChachHelper.putData(key: "GardenLampState",value: gardenlamp);
  emit(LampgardenState());
}

bool doors = false;
 void closedoors(){
     doors !=doors;

     if(door==true){
      Doorstate();
     }else{
      door==false;
     
     }
   if(garagedoor==true){
    GarageDoor();
   }else{
     garagedoor==false;
   }

    if(wendo==true){
    Wendostate();
   }else{
     wendo==false;
   }
   
 
  emit(ClosealldoorState());
 }

 bool electric = false;
 void closeAllelecric(){
     electric !=electric;

     if(lamp1==true){
      
      Lamp1State();
      
     }else{
      lamp1==false;
     
     }
   if(lamp2==true){
    Lamp2state();
   }else{
     lamp2==false;
   }

   if(fan==true){
    Fanstate();
    
   }else{
     fan==false;
     
   }

   if(garagelamp==true){
    GarageLamp();
    
   }else{
     garagelamp==false;
   }
    
  if(gardenlamp==true){
    GardenLamp();
   }else{
     gardenlamp==false;
   }
 
  emit(ClosealllampsState());
 }

 bool allhome = false;
 void closeAllHome(){
     electric !=electric;

     if(lamp1==true){
      
      Lamp1State();
      
     }else{
      lamp1==false;
     
     }
   if(lamp2==true){
    Lamp2state();
   }else{
     lamp2==false;
   }

   if(fan==true){
    Fanstate();
   }else{
     fan==false;
   }

   if(garagelamp==true){
    GarageLamp();
   }else{
     garagelamp==false;
   }
    
  if(gardenlamp==true){
    GardenLamp(GardenLampState: allhome);
   }else{
     gardenlamp==false;
   }

    if(door==true){
      Doorstate();
     }else{
      door==false;
     
     }
   if(garagedoor==true){
    GarageDoor();
   }else{
     garagedoor==false;
   }

    if(wendo==true){
    Wendostate();
   }else{
     wendo==false;
   }
 
  emit(CloseallhomeState());
 }



}