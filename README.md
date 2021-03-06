# service_registry
[![Version](https://img.shields.io/badge/version-2.0.1-blue.svg)](https://pub.dartlang.org/packages/service_registry)
[![Build Status](https://travis-ci.org/Panthro/ServiceRegistry.svg?branch=master)](https://travis-ci.org/Panthro/ServiceRegistry)

A service registry for doing IoC on Dart.

## Motivation

Basically because I did not know how to properly handle singletons in a flutter application, so I did this for a project
and felt that I could share.

## Usage

```dart
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
  ServiceRegistry.registerService<CounterService>(new CounterService());

  var counterService = ServiceRegistry.getService<CounterService>();
  counterService.increment();
  counterService.increment();
  print(ServiceRegistry.getService<CounterService>().count); // 2

  counterService.decrement();

  // Actually you don't need to add the <CounterService> part, but it's handy for tools to know the type and provide code completion
  print(ServiceRegistry.getService<CounterService>().count); // 1
}


```


## TODO
- [] add coverage reporting
- [] check service type with the given register type