class Validators {
  static var numbersAndAlphabets = RegExp(r'^[A-Za-z0-9]+$');
  var i = RegExp(r"^[$&+,:;=?@#|'<>.^*()%!-]");
  static var specialCharacters = RegExp(r"^[$&+,:;=?@#|'<>.^*()%!-]");


  static String? fullName(String? value) {
    String title = "Full name";
    if (value == null || value.isEmpty) {
      return "$title can not be empty";
    } else {
      // check length of string
      // if (value.contains(" ")) {
        // String first = value.split(" ").first;
        // String last = value.split(" ").last;
        // if (last.length.toString().endsWith(' ')) {
        //   return "each name must be atleast 3+ chars";
          // } else
          //     return null;
          //   }
          // }
        // }

        if (value.length < 5){
          return "Username must be between 5/32 characters";
        }
      // }
      // else {
      //   return "please enter a valid $title";
      // }
    }
    return null;
  }

  static String? email(String? value) {
    String title = "email";
    String reg =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value == null || value.isEmpty) {
      return "$title can not be empty";
    } else {
      // check length of string
      RegExp regExp = RegExp(reg);
      if (!regExp.hasMatch(value)) {
        return "Please enter a valid $title";
      } else {
        return null;
      }
    }
  }

  static String? password(String title, String? value) {
    if (value == null || value.isEmpty) {
      return "$title can not be empty";
    } else {
      // check length of string
      if (value.length < 6) {
        // print(value.length);
        return "$title must be at least 6 characters long";
      } else {
        return null;
      }
    }
  }
}