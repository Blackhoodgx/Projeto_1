  String validMail(String email) {
    // see if email have a @ and a dot
    if (!email.contains("@") || !email.contains(".")) {
      return "invalid email, use a valid email";
    }

    return "validEmail";
  }

