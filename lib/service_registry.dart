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
  static T registerService<T>(T service) {
    //TODO somehow check that service *is* an instance of type
    _services[T] = service;
    return service;
  }

  /**
   * Get a previously registered service.
   *
   * Throws an [AssertError] if there is no registered service for the given [serviceType]
   */
  static T getService<T>() {
    var service = _services[T];
    assert(service != null, "Service of type $T was not previously registered");
    return _services[T];
  }

  /**
   * Whether a service of the given [serviceType] was previously registered
   *
   * This is an utility method as calling [getService] could throw an exception.
   */
  static bool hasService(Type serviceType) {
    return _services.isNotEmpty && _services[serviceType] != null;
  }

  /**
   * Clear all the registered services
   */
  static void clear() {
    _services.clear();
  }
}
