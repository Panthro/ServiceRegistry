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

  test("shold clear the services", () {
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
}
