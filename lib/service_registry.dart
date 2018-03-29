library service_registry;

/**
 * A ServiceRegistry implementation that will make your life easier
 *
 * Basic Usage:
 *
 *     class SampleService {}
 *
 *     void main(){
 *
 *         ServiceRegistry.registerService(SampleService, new SampleService())
 *
 *         // Do something and then retrieve the service
 *
 *         SampleService service = ServiceRegistry.getService<SampleService>(SampleService);
 *
 *         // Use the service
 *
 *     }
 *
 */
class ServiceRegistry {
  /// The map containing all registered services
  static Map<Type, dynamic> _services = {};

  /// An unmodifiable map with all registered services
  static Map<Type, dynamic> get services => new Map.unmodifiable(_services);

  /**
   * Register a service.
   *
   * Registers the given [service] for the given [type], overwriting any previously registered service for the type
   *
   */
  static T registerService<T>(Type type, T service) {
    //TODO somehow check that service *is* an instance of type
    _services[type] = service;
    return service;
  }

  /**
   * Get a previously registered service.
   *
   * Throws an [AssertError] if there is no registered service for the given [serviceType]
   */
  static T getService<T>(Type serviceType) {
    var service = _services[serviceType];
    assert(service != null, "Service of type $serviceType was not previously registered");
    return _services[serviceType];
  }

  /**
   * Clear all the registered services
   */
  static void clear() {
    _services.clear();
  }
}
