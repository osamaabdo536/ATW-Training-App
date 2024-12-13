String? passwordValidation(text) {
  if (text == null || text.trim().isEmpty) {
    return "Please enter your Password";
  }
  // bool isValidPassword =
  // RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
  //     .hasMatch(text);
  // if (!isValidPassword) {
  //   return "Wrong Password !";
  // }
  return null;
}