# flutter-eureka-2023
Reacquainting with modern Flutter &amp; BLoC. Diving back into the Flutter ecosystem and discovering the latest approaches and best practices.

## Tests

### Run tests with coverage

Run unit tests:

```flutter test --coverage```

Run integration tests:

```flutter test test_integration```

### Generate coversage report

Install lcov first, e.g. using brew: `brew install lcov`.

```genhtml coverage/lcov.info -o coverage/html```
