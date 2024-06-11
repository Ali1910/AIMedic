String? validation(String? p0) {
  RegExp regex =
      RegExp(r'^\d{1,4}$|^\d{1,3}\.\d$|^\d{1,2}\.\d{1,2}$|^\d\.\d{1,3}$');
  if (p0?.isEmpty ?? true) {
    return 'هذا الحقل مطلوب';
  } else if (!regex.hasMatch(p0!)) {
    return "تأكد من القيمة المدخلة";
  } else {
    return null;
  }
}
