import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  const PasswordField({Key? key, this.prefixIcon, this.onChanged}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
      validator: (s){
        if(s!.isEmpty) return 'Password is required.';
        return null;
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: "Password",
        counter: const SizedBox(height: 0,),
        hintText: "Password",
        prefixIcon: widget.prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}