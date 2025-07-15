enum UserType { public, volunteer }

class MockAuth {
  static UserType? currentUserType;

  static void login({required UserType userType}) {
    currentUserType = userType;
  }

  static void signup({required UserType userType}) {
    currentUserType = userType;
  }

  static void logout() {
    currentUserType = null;
  }
} 