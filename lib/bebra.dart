class bigbebra{
  late String q;
  late String a;
  late String h;

  bigbebra(this.q, this.a, this.h);

  bigbebra.fromJSON(Map json):
    q = json['q'],
    a = json['a'],
    h = json['h'];
}