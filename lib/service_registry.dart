library service_registry;

/// a ServiceRegistry implementation that will make your life easier
class ServiceRegistry {
  static Map<Type, dynamic> _services = {};

  static Map<Type, dynamic> get services => new Map.unmodifiable(_services);

  static T registerService<T>(Type type, T service) {
    //TODO somehow check that service *is* an instance of type
    _services[type] = service;
    return service;
  }

  static T getService<T>(Type serviceType) {
    var service = _services[serviceType];
    assert(service != null, "Service of type $serviceType was not previously registered");
    return _services[serviceType];
  }

  static void clear() {
    _services.clear();
  }
}
