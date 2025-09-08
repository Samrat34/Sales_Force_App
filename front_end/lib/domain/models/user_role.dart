enum UserRole { superAdmin, adminEmployee, client, clientEmployee, customer }

extension UserRoleExtension on UserRole {
  String get name {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.adminEmployee:
        return 'Admin Employee';
      case UserRole.client:
        return 'Client';
      case UserRole.clientEmployee:
        return 'Client Employee';
      case UserRole.customer:
        return 'Customer';
    }
  }

  // Define permissions for each role
  bool get canManageUsers {
    return this == UserRole.superAdmin;
  }

  bool get canManagePermissions {
    return this == UserRole.superAdmin || this == UserRole.adminEmployee;
  }

  bool get canViewReports {
    return this != UserRole.customer;
  }

  bool get canManageClients {
    return this == UserRole.superAdmin || this == UserRole.adminEmployee;
  }

  bool get canAccessAdminPanel {
    return this == UserRole.superAdmin || this == UserRole.adminEmployee;
  }

  bool get canViewSecurityCenter {
    return this == UserRole.superAdmin;
  }
}
