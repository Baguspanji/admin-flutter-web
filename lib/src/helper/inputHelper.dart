import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    required this.controller,
    required this.label,
    required this.hint,
    this.type,
    this.hidden,
    this.validator,
    this.onChange,
    this.onTap,
  });

  final TextEditingController controller;
  final String label, hint;
  final TextInputType? type;
  final bool? hidden;
  final Function? validator, onChange, onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        onTap == null ? () {} : onTap!();
      },
      controller: controller,
      keyboardType: type == null ? TextInputType.text : type,
      obscureText: hidden == null ? false : hidden!,
      enableSuggestions: true,
      autocorrect: true,
      validator: (value) {
        validator == null ? () {} : validator!(value);
      },
      onChanged: (value) {
        onChange == null ? () {} : onChange!(value);
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: hint,
        fillColor: Colors.white70,
      ),
    );
  }
}
