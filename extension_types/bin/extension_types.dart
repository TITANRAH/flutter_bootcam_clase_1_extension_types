void main() {
  final startAt = DateTime.now();

  final salaryA = MoneyWrapper(1000.0);
  final salaryB = MoneyWrapper(1000.0);
  print(salaryA + salaryB);
  print(salaryA == salaryB);
  salaryB.isMinSalary();
  final finishAt = DateTime.now();
// option + ? = \
  print('time msec: ${finishAt.difference(startAt).inMicroseconds}\n\n');

// con extension type
  final startAt2 = DateTime.now();
  final salaryA2 = Money(1000.0);
  final salaryB2 = Money(1000.9);
  print(salaryA2 + salaryB2);
  print(salaryA2 == salaryB2);
  salaryB2.isMinSalary();
  print(salaryB2.round());
  final finishAt2 = DateTime.now();

  print('time msec: ${finishAt2.difference(startAt2).inMicroseconds}');
}

// usar las propiedades de una clase es mejor asi
extension type Money._(double value) implements double {
  // de essta manera valido con assert en un extension type poniendo ._
  Money(this.value) : assert(value >= 0);

  Money operator +(Money other) {
    return Money(value + other.value);
  }

  bool isMinSalary() {
    return value > 425;
  }
}

class MoneyWrapper {
  // este assert valida que el alor no puede ser mayor a cero
  MoneyWrapper(this.value) : assert(value >= 0.0);
  final double value;

  // String get formattedCurrency => ;

  @override
  String toString() => 'S/. ${value.toStringAsFixed(2)}';

  MoneyWrapper operator +(MoneyWrapper other) {
    return MoneyWrapper(value + other.value);
  }

  // creo funciones como esta y seran propiedades de la clase para utilizar
  bool isMinSalary() {
    return value > 425;
  }

  @override
  bool operator ==(Object other) {
    if (other is! MoneyWrapper) {
      return false;
    }
    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
