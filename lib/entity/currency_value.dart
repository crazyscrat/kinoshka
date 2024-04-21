class 	CurrencyValue{
  int? value;
  String? currency;

  CurrencyValue({this.value, this.currency});
}

class Fees{
  CurrencyValue? world;
  CurrencyValue? russia;
  CurrencyValue? usa;

  Fees({this.world, this.russia, this.usa});
}