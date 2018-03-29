import 'package:service_registry/service_registry.dart';
import 'package:test/test.dart';

class TestService {}

void main() {
  setUp(() {
    ServiceRegistry.clear();
  });

  test("should register a service", () {
    var testService = new TestService();

    expect(ServiceRegistry.services, isEmpty);

    ServiceRegistry.registerService(TestService, testService);

    expect(ServiceRegistry.services, isNotEmpty);
  });

  test("should overwrite a previously registered service", () {
    var testService1 = new TestService();
    var testService2 = new TestService();

    expect(ServiceRegistry.services, isEmpty);

    ServiceRegistry.registerService(TestService, testService1);

    expect(ServiceRegistry.services, isNotEmpty);

    ServiceRegistry.registerService(TestService, testService2);

    expect(ServiceRegistry.services, hasLength(1));

    expect(ServiceRegistry.getService(TestService), equals(testService2));
  });

  test("should retrieve a previous registered service", () {
    var testService = new TestService();

    expect(ServiceRegistry.services, isEmpty);

    ServiceRegistry.registerService(TestService, testService);

    expect(ServiceRegistry.services, isNotEmpty);
    expect(testService, equals(ServiceRegistry.getService(TestService)));
  });

  test("Should clear the services", () {
    var testService = new TestService();

    expect(ServiceRegistry.services, isEmpty);

    ServiceRegistry.registerService(TestService, testService);

    expect(ServiceRegistry.services, isNotEmpty);

    ServiceRegistry.clear();

    expect(ServiceRegistry.services, isEmpty);
  });

  test("Should throw exception whe getting unregistered service", () {
    expect(ServiceRegistry.services, isEmpty);
    expect(() {
      ServiceRegistry.getService(TestService);
    }, throwsA(new isInstanceOf<AssertionError>()));
  });

  test("hasService shold return false when service was not previously registered", () {
    expect(ServiceRegistry.services, isEmpty);

    expect(ServiceRegistry.hasService(TestService), isFalse);

    expect(ServiceRegistry.services, isEmpty);
  });

  test("hasService shold return true when service was previously registered", () {
    var testService = new TestService();

    expect(ServiceRegistry.services, isEmpty);

    ServiceRegistry.registerService(TestService, testService);

    expect(ServiceRegistry.hasService(TestService), isTrue);
  });
}
