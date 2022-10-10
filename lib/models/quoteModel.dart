class QuoteModel{
  QuoteModel({this.category, this.quote , this.author});
  String? category;
  String? quote;
  String? author;

  factory QuoteModel.fromJson(Map<String, dynamic> data) {
    final category = data["category"];
    final quote=data["quote"];
    final author=data["author"];
    

    return QuoteModel(category: category, quote: quote , author: author);

  }
}