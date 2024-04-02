import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import '../../../../../core/utilts/style.dart';

class CustomEmailTextFormFeild extends StatelessWidget {
  const CustomEmailTextFormFeild(
      {super.key, required this.onChanged, required this.onSaved});
  final void Function(String) onChanged;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'هذا الحقل مطلوب لا يمكن ان يكون فارغا';
        } else {
          return null;
        }
      },
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'ادخل الحساب الخاص بك هنا ',
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
