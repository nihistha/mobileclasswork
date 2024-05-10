class SimpleInterestModel{
  final double? principle;
  final double? rate;
  final double? time;

  SimpleInterestModel({
    required this.principle,
    required this.rate,
    required this.time,
  });
  double simpleInterest(){
    return (principle!* time!* rate!)/100;
  }
}