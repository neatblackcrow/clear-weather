abstract class BaseState<E extends Enum> {
  E get stateType;
}

extension EnumFromString<E extends Enum> on Iterable<E> {
  E enumFromString(String enumName) =>
      singleWhere((element) => element.name == enumName);
}
