import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class DateTimePickerTextField extends StatefulWidget {
  TextEditingController controller;
  String LabelText;
  DateTimePickerTextField({Key? key,required this.controller,required this.LabelText}) : super(key: key);

  @override
  State<DateTimePickerTextField> createState() => _DateTimePickerTextFieldState();
}

class _DateTimePickerTextFieldState extends State<DateTimePickerTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:widget.controller , //editing controller of this TextField
      decoration: InputDecoration(
          icon: Icon(Icons.timer), //icon of text field
          labelText: "To Time" //label text of field
      ),
      readOnly: true,  //set it true, so that user will not able to edit text
      onTap: () async {
        TimeOfDay? pickedTime =  await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        if(pickedTime != null ){
          print(pickedTime.format(context));   //output 10:51 PM
          DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
          //converting to DateTime so that we can further format on different pattern.
          print(parsedTime); //output 1970-01-01 22:53:00.000
          String formattedTime = DateFormat('HH:mm a').format(parsedTime);
          print(formattedTime); //output 14:59:00
          //DateFormat() is from intl package, you can format the time on any pattern you need.

          setState(() {
            widget.controller.text = formattedTime; //set the value of text field.
          });
        }else{
          print("To Time");
        }
      },
    );
  }
}