class AppConstants {
  static const List<String> userRoles = [
    'Admin',
    'Company Employee',
    'Client',
    'Client Employee',
    'Customer',
  ];

  static const Map<String, String> roleDescriptions = {
    'Admin': 'Full system access & control',
    'Company Employee': 'Company operations & management',
    'Client': 'Client business management',
    'Client Employee': 'Client operations support',
    'Customer': 'Product purchasing & support',
  };

  static const Map<String, String> roleSubtitles = {
    'Admin': 'System Administrator',
    'Company Employee': 'John Doe',
    'Client': 'ABC Distributors Ltd',
    'Client Employee': 'Jane Smith',
    'Customer': 'Product Consumer',
  };
}
