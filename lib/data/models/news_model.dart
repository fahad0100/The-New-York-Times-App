
class NewsModel {
  NewsModel({
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
  late final String? column;
  late final String byline;
  late final String type;
  late final String title;
  late final String abstract;
  late final List<String> desFacet;
  late final List<String>? orgFacet;
  late final List<String>? perFacet;
  late final List<String> geoFacet;
  late final List<Media?>? media;
  late final int etaId;

  NewsModel.fromJson(Map<String, dynamic> json) {
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
    media = json['media'] == []
        ? []
        : List.from(json['media']).map((e) => Media.fromJson(e)).toList();

    etaId = json['eta_id'];
  }

  Map<String, dynamic> toJson() {
    final myData = <String, dynamic>{};
    myData['uri'] = uri;
    myData['url'] = url;
    myData['id'] = id;
    myData['asset_id'] = assetId;
    myData['source'] = source;
    myData['published_date'] = publishedDate;
    myData['updated'] = updated;
    myData['section'] = section;
    myData['subsection'] = subsection;
    myData['nytdsection'] = nytdsection;
    myData['adx_keywords'] = adxKeywords;
    myData['column'] = column;
    myData['byline'] = byline;
    myData['type'] = type;
    myData['title'] = title;
    myData['abstract'] = abstract;
    myData['des_facet'] = desFacet;
    myData['org_facet'] = orgFacet;
    myData['per_facet'] = perFacet;
    myData['geo_facet'] = geoFacet;
    myData['media'] = media?.map((e) => e?.toJson()).toList();
    myData['eta_id'] = etaId;
    return myData;
  }
}

class Media {
  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });
  late final String type;
  late final String subtype;
  late final String caption;
  late final String copyright;
  late final int approvedForSyndication;
  late final List<MediaMetadata?>? mediaMetadata;

  Media.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subtype = json['subtype'];
    caption = json['caption'];
    copyright = json['copyright'];
    approvedForSyndication = json['approved_for_syndication'];
    mediaMetadata = json['media-metadata'] != null
        ? List.from(json['media-metadata'])
            .map((e) => MediaMetadata.fromJson(e))
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['subtype'] = subtype;
    data['caption'] = caption;
    data['copyright'] = copyright;
    data['approved_for_syndication'] = approvedForSyndication;
    data['media-metadata'] = mediaMetadata?.map((e) => e?.toJson()).toList();
    return data;
  }
}

class MediaMetadata {
  MediaMetadata({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });
  late final String url;
  late final String format;
  late final int height;
  late final int width;

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    format = json['format'];
    height = json['height'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final MyData = <String, dynamic>{};
    MyData['url'] = url;
    MyData['format'] = format;
    MyData['height'] = height;
    MyData['width'] = width;
    return MyData;
  }
}
