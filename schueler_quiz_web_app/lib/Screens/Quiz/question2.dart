import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget question2(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Ziehe die Teile in eine Reihenfolge die Sinn ergibt', style: Theme.of(context).textTheme.bodyText1,),
        draggable(2, size, context),
        Column(
          children: [
            dtRow('08:00 - 09:00 ', size, context), dtRow('09:00 - 10:00 ', size, context), dtRow('10:00 - 11:00 ', size, context), dtRow('11:00 - 12:00 ', size, context),
            dtRow('mittag', size, context),dtRow('12:45 - 13:45 ', size, context), dtRow('13:45 - 14:45 ', size, context), dtRow('14:45 - 15:45 ', size, context),  
          ],
        ), 
      ],
    ),
  );
}

Widget dtRow(String time, Size size, BuildContext context){
  if(time == 'mittag'){
    return Row(children: [SizedBox(height: 0.75*((size.height-400)/8),)]);
  }
  return Row(
    children: [
      Text(time, style: Theme.of(context).textTheme.bodyText1,), dragtarget(size), dragtarget(size), dragtarget(size), dragtarget(size), dragtarget(size)
    ],
  );
}

Widget dragtarget(Size size){
  return DragTarget(
    onWillAccept: (value) => value != Colors.black,
    onAccept: (value) {
      //setState(){}
    },
    builder: (context, candidates, rejects){
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(color: Colors.white, height: (size.height-400)/8, width: (size.width-200)/6,),
      );
    }
  );
}

Widget draggable(double time, Size size, BuildContext context){
  return Draggable(
    child: timeSlot(2, size, context), 
    feedback: timeSlot(2, size, context),
    childWhenDragging: SizedBox(),
    //data: 2,
  );
}

Widget timeSlot(double time, Size size, BuildContext context){
  return Container(
    child: time != 0? Center(child: Text(time.toString() + 'h', style: Theme.of(context).textTheme.bodyText2,)) : SizedBox(height: 0,), 
    height: time * ((size.height-400)/8), 
    width: (size.width-200)/6, 
    decoration: BoxDecoration(color: Colors.white70),
  );
}