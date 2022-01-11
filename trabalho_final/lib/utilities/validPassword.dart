  String validPassword(String password) {
    // see if the password have 8 characters
    if (password.length < 8) {
      return "The password need a least 8 characters.";
    }

    // see if the password have a lowercase letters
    if (!password.contains(RegExp(r"[a-z]"))) {
      return "the password need at least one lowercase letter";
    }

    // see if the password have a uppercase letters
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return "the password need at least one uppercase letter";
    }

    // see if the password have a number
    if (!password.contains(RegExp(r"[0-9]"))) {
      return "the password need at least one number";
    }

    // see if the password have a special character
    if (!password.contains(RegExp(r'[_\-=@,\.;!#$%^&/%*()?":{}|<>]'))) {
      return "the password need at least one special character";
    }

    return "validPassword";
  }

