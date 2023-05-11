class EnvName {
  static const String dev = 'dev';
  static const String prod = 'prod';
}

class EnvConfigs {
  static var dev = {
    'name': EnvName.dev,
    'apiHost': "https://example.com",
    'webHost': "https://example.com",
  };

  static var prod = {
    'name': EnvName.prod,
    'apiHost': "https://example.com",
    'webHost': "https://example.com",
  };
}
