import 'package:equatable/equatable.dart';

class NQRuku extends Equatable {
  final int id;
  final int startIndexSura;
  final int startIndexAya;
  final int numOfAyas;

  const NQRuku({
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
