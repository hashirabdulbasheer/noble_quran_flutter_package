import 'package:equatable/equatable.dart';

class Ruku extends Equatable {
  final int id;
  final int startIndexSura;
  final int startIndexAya;
  final int numOfAyas;

  const Ruku({
    required this.id,
    required this.startIndexSura,
    required this.startIndexAya,
    required this.numOfAyas,
  });

  @override
  List<Object?> get props => [
        id,
        startIndexSura,
        startIndexAya,
        numOfAyas,
      ];
}
