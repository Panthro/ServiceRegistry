import 'package:service_registry/service_registry.dart';

class CounterService {
  int count = 0;

  increment() {
    count++;
  }

  decrement() {
    count--;
  }
}

void main() {
  ServiceRegistry.registerService<CounterService>(CounterService, new CounterService());

  var counterService = ServiceRegistry.getService<CounterService>(CounterService);
  counterService.increment();
  counterService.increment();
  print(ServiceRegistry.getService<CounterService>(CounterService).count); // 2

  counterService.decrement();

  // Actually you don't need to add the <CounterService> part, but it's handy for tools to know the type and provide code completion
  print(ServiceRegistry.getService<CounterService>(CounterService).count); // 1
}
