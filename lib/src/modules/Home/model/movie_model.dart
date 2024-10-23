class MoviesModel {
  MoviesModel({
    required this.search,
    required this.totalResults,
    required this.Response,
  });
  late final List<SearchModel> search;
  late final String totalResults;
  late final String Response;
  
  MoviesModel.fromJson(Map<String, dynamic> json){
    search = List.from(json['Search']).map((e)=>SearchModel.fromJson(e)).toList();
    totalResults = json['totalResults'];
    Response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Search'] = search.map((e)=>e.toJson()).toList();
    _data['totalResults'] = totalResults;
    _data['Response'] = Response;
    return _data;
  }
}

class SearchModel {
  SearchModel({
    required this.Title,
    required this.Year,
    required this.imdbID,
    required this.Type,
    required this.Poster,
  });
  late final String Title;
  late final String Year;
  late final String imdbID;
  late final String Type;
  late final String Poster;
  
  SearchModel.fromJson(Map<String, dynamic> json){
    Title = json['Title'];
    Year = json['Year'];
    imdbID = json['imdbID'];
    Type = json['Type'];
    Poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Title'] = Title;
    _data['Year'] = Year;
    _data['imdbID'] = imdbID;
    _data['Type'] = Type;
    _data['Poster'] = Poster;
    return _data;
  }
}