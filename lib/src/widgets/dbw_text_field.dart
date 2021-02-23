import 'package:flutter/material.dart';

class DBWTextField extends StatelessWidget {
  final TextInputType inputType;
  final TextEditingController textController;
  final Function onChange;
  final bool isPassword;
  final IconData icon;
  final String placeHolder;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double width;
  final String errorText;
  final Function onTap;

  DBWTextField({
    this.icon,
    this.placeHolder,
    this.textController,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.margin,
    this.padding,
    this.width = double.infinity,
    this.onChange,
    this.errorText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final marginDefault = EdgeInsets.only(top: 20.0);
    final paddingDefault = EdgeInsets.only(
      top: 5,
      bottom: 5,
      left: 10,
      right: 20,
    );

    return Container(
      margin: this.margin == null ? marginDefault : this.margin,
      padding: this.padding == null ? paddingDefault : this.padding,
      width: this.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 5),
              blurRadius: 5,
            ),
          ]),
      child: TextField(
        onTap: this.onTap,
        controller: textController,
        autocorrect: false,
        keyboardType: inputType,
        obscureText: isPassword,
        onChanged: this.onChange,
        decoration: InputDecoration(
          icon: Icon(icon),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: placeHolder,
          errorText: this.errorText,
        ),
      ),
    );
  }
}
