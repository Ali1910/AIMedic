import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/core/utilts/style.dart';

class CustomSignUpTextFormFeild extends StatelessWidget {
  const CustomSignUpTextFormFeild({
    super.key,
    required this.hint,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
  });
  final String hint;
  final void Function(String?) onSaved;
  final void Function(String) onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Styles.style16.copyWith(color: Colors.grey.withOpacity(0.7)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: Styles.borderStyle(
          Colors.grey.withOpacity(0.5),
        ),
        focusedBorder: Styles.borderStyle(
          mainColor.withOpacity(0.7),
        ),
      ),
    );
  }
}
