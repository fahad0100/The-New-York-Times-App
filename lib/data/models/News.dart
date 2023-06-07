class News {
  News({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });
  late final String uri;
  late final String url;
  late final int id;
  late final int assetId;
  late final String source;
  late final String publishedDate;
  late final String updated;
  late final String section;
  late final String subsection;
  late final String nytdsection;
  late final String adxKeywords;
  late final Null column;
  late final String byline;
  late final String type;
  late final String title;
  late final String abstract;
  late final List<String> desFacet;
  late final List orgFacet;
  late final List perFacet;
  late final List<String> geoFacet;
  late final List<Media> media;
  late final int etaId;

  News.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    url = json['url'];
    id = json['id'];
    assetId = json['asset_id'];
    source = json['source'];
    publishedDate = json['published_date'];
    updated = json['updated'];
    section = json['section'];
    subsection = json['subsection'];
    nytdsection = json['nytdsection'];
    adxKeywords = json['adx_keywords'];
    column = null;
    byline = json['byline'];
    type = json['type'];
    title = json['title'];
    abstract = json['abstract'];
    desFacet = List.castFrom(json['des_facet']);
    orgFacet = List.castFrom(json['org_facet']);
    perFacet = List.castFrom(json['per_facet']);
    geoFacet = List.castFrom(json['geo_facet']);
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
    etaId = json['eta_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uri'] = uri;
    _data['url'] = url;
    _data['id'] = id;
    _data['asset_id'] = assetId;
    _data['source'] = source;
    _data['published_date'] = publishedDate;
    _data['updated'] = updated;
    _data['section'] = section;
    _data['subsection'] = subsection;
    _data['nytdsection'] = nytdsection;
    _data['adx_keywords'] = adxKeywords;
    _data['column'] = column;
    _data['byline'] = byline;
    _data['type'] = type;
    _data['title'] = title;
    _data['abstract'] = abstract;
    _data['des_facet'] = desFacet;
    _data['org_facet'] = orgFacet;
    _data['per_facet'] = perFacet;
    _data['geo_facet'] = geoFacet;
    _data['media'] = media.map((e) => e.toJson()).toList();
    _data['eta_id'] = etaId;
    return _data;
  }
}

class Media {
  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediametadata,
  });
  late final String type;
  late final String subtype;
  late final String caption;
  late final String copyright;
  late final int approvedForSyndication;
  late final List<Mediametadata> mediametadata;

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    mediametadata = List.from(json['media-metadata'])
        .map((e) => Mediametadata.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['subtype'] = subtype;
    _data['caption'] = caption;
    _data['copyright'] = copyright;
    _data['approved_for_syndication'] = approvedForSyndication;
    _data['media-metadata'] = mediametadata.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Mediametadata {
  Mediametadata({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });
  late final String url;
  late final String format;
  late final int height;
  late final int width;

  Mediametadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['format'] = format;
    _data['height'] = height;
    _data['width'] = width;
    return _data;
  }
}
