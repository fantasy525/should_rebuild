# ShouldRebuild

[![Star this Repo](https://img.shields.io/github/stars/fantasy525/should_rebuild)](https://github.com/fantasy525/should_rebuild)
[![pub package](https://img.shields.io/pub/v/should_rebuild.svg)](https://pub.dartlang.org/packages/should_rebuild)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/fantasy525/should_rebuild)](https://github.com/fantasy525/should_rebuild/issues)
[![GitHub forks](https://img.shields.io/github/forks/fantasy525/should_rebuild)](https://github.com/fluttercandies/should_rebuild/forks)

A widget can prevent Child Widget unnecessary rebuilds.You can filter whether you need rebuild based on whether the property values received by the old Child Widget and the new Child Widget are equal.

(这个widget可以防止它的child发生不必要的rebuilds，你可以判断新的Child Widget和旧的Child Widget接收的属性值是否相等来过滤是否需要rebuild)

### Add dependency
```yaml
dependencies:
  should_rebuild: 1.0.1
```
Or
```yaml
dependencies:
  should_rebuild:
      git:
        url: https://github.com/fluttercandies/should_rebuild
```

## Super simple to use

```dart
ShouldRebuild<Todo>(
    shouldRebuild: (oldWidget, newWidget) => oldWidget.counter != newWidget.counter,
    child: Todo(counter: counter,)
),
```
Todo Widget
```dart
class Todo extends StatelessWidget {
  final int counter;
  Todo({this.counter});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(counter.toString()),
    );
  }
}
```
The Todo widget only rebuilds if counter changes

ShouldRebuild Widget is a generic StatefulWidget,this generic represents the type of Widget returned by the builder method



