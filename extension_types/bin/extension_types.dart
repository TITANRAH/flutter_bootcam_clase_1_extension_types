void main() {
  final startAt = DateTime.now();

  final salaryA = Money(1000.0);
  final salaryB = Money(1000.0);
  print(salaryA + salaryB);
  
  final finishAt = DateTime.now();

  print('time msec: ${finishAt.difference(startAt).inMicroseconds}');


}

class Money {
  Money(this.value) : assert(value >= 0.0);
  final double value;

  String get formattedCurrency => 'S/. ${value.toStringAsFixed(2)}';

  @override
  String toString() => formattedCurrency;

  Money operator +(Money other) {
    return Money(value + other.value);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Money) {
      return false;
    }
    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
