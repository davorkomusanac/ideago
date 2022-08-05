// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_idea.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarIdeaCollection on Isar {
  IsarCollection<IsarIdea> get isarIdeas => getCollection();
}

const IsarIdeaSchema = CollectionSchema(
  name: 'IsarIdea',
  schema:
      '{"name":"IsarIdea","idName":"id","properties":[{"name":"capitalExplanation","type":"String"},{"name":"categories","type":"StringList"},{"name":"dateTimeCreated","type":"Long"},{"name":"dateTimeLastUpdated","type":"Long"},{"name":"differentiationExplanation","type":"String"},{"name":"fullDescription","type":"String"},{"name":"index","type":"Double"},{"name":"rating","type":"Long"},{"name":"ratingQuestions","type":"String"},{"name":"revenueExplanation","type":"String"},{"name":"speedExplanation","type":"String"},{"name":"status","type":"String"},{"name":"summary","type":"String"},{"name":"title","type":"String"},{"name":"uid","type":"String"}],"indexes":[{"name":"categories","unique":false,"properties":[{"name":"categories","type":"HashElements","caseSensitive":false}]},{"name":"dateTimeCreated","unique":false,"properties":[{"name":"dateTimeCreated","type":"Value","caseSensitive":false}]},{"name":"dateTimeLastUpdated","unique":false,"properties":[{"name":"dateTimeLastUpdated","type":"Value","caseSensitive":false}]},{"name":"fullDescription","unique":false,"properties":[{"name":"fullDescription","type":"Hash","caseSensitive":false}]},{"name":"index","unique":false,"properties":[{"name":"index","type":"Value","caseSensitive":false}]},{"name":"rating","unique":false,"properties":[{"name":"rating","type":"Value","caseSensitive":false}]},{"name":"summary","unique":false,"properties":[{"name":"summary","type":"Hash","caseSensitive":false}]},{"name":"title","unique":false,"properties":[{"name":"title","type":"Hash","caseSensitive":false}]},{"name":"uid","unique":true,"properties":[{"name":"uid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'capitalExplanation': 0,
    'categories': 1,
    'dateTimeCreated': 2,
    'dateTimeLastUpdated': 3,
    'differentiationExplanation': 4,
    'fullDescription': 5,
    'index': 6,
    'rating': 7,
    'ratingQuestions': 8,
    'revenueExplanation': 9,
    'speedExplanation': 10,
    'status': 11,
    'summary': 12,
    'title': 13,
    'uid': 14
  },
  listProperties: {'categories'},
  indexIds: {
    'categories': 0,
    'dateTimeCreated': 1,
    'dateTimeLastUpdated': 2,
    'fullDescription': 3,
    'index': 4,
    'rating': 5,
    'summary': 6,
    'title': 7,
    'uid': 8
  },
  indexValueTypes: {
    'categories': [
      IndexValueType.stringHashCIS,
    ],
    'dateTimeCreated': [
      IndexValueType.long,
    ],
    'dateTimeLastUpdated': [
      IndexValueType.long,
    ],
    'fullDescription': [
      IndexValueType.stringHashCIS,
    ],
    'index': [
      IndexValueType.double,
    ],
    'rating': [
      IndexValueType.long,
    ],
    'summary': [
      IndexValueType.stringHashCIS,
    ],
    'title': [
      IndexValueType.stringHashCIS,
    ],
    'uid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarIdeaGetId,
  setId: _isarIdeaSetId,
  getLinks: _isarIdeaGetLinks,
  attachLinks: _isarIdeaAttachLinks,
  serializeNative: _isarIdeaSerializeNative,
  deserializeNative: _isarIdeaDeserializeNative,
  deserializePropNative: _isarIdeaDeserializePropNative,
  serializeWeb: _isarIdeaSerializeWeb,
  deserializeWeb: _isarIdeaDeserializeWeb,
  deserializePropWeb: _isarIdeaDeserializePropWeb,
  version: 3,
);

int? _isarIdeaGetId(IsarIdea object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarIdeaSetId(IsarIdea object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarIdeaGetLinks(IsarIdea object) {
  return [];
}

const _isarIdeaIsarIdeaRatingQuestionConverter =
    IsarIdeaRatingQuestionConverter();

void _isarIdeaSerializeNative(
    IsarCollection<IsarIdea> collection,
    IsarRawObject rawObj,
    IsarIdea object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.capitalExplanation;
  final _capitalExplanation = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_capitalExplanation.length) as int;
  final value1 = object.categories;
  dynamicSize += (value1.length) * 8;
  final bytesList1 = <IsarUint8List>[];
  for (var str in value1) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList1.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _categories = bytesList1;
  final value2 = object.dateTimeCreated;
  final _dateTimeCreated = value2;
  final value3 = object.dateTimeLastUpdated;
  final _dateTimeLastUpdated = value3;
  final value4 = object.differentiationExplanation;
  final _differentiationExplanation =
      IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_differentiationExplanation.length) as int;
  final value5 = object.fullDescription;
  final _fullDescription = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_fullDescription.length) as int;
  final value6 = object.index;
  final _index = value6;
  final value7 = object.rating;
  final _rating = value7;
  final value8 =
      _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(object.ratingQuestions);
  final _ratingQuestions = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_ratingQuestions.length) as int;
  final value9 = object.revenueExplanation;
  final _revenueExplanation = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_revenueExplanation.length) as int;
  final value10 = object.speedExplanation;
  final _speedExplanation = IsarBinaryWriter.utf8Encoder.convert(value10);
  dynamicSize += (_speedExplanation.length) as int;
  final value11 = object.status;
  final _status = IsarBinaryWriter.utf8Encoder.convert(value11);
  dynamicSize += (_status.length) as int;
  final value12 = object.summary;
  final _summary = IsarBinaryWriter.utf8Encoder.convert(value12);
  dynamicSize += (_summary.length) as int;
  final value13 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value13);
  dynamicSize += (_title.length) as int;
  final value14 = object.uid;
  final _uid = IsarBinaryWriter.utf8Encoder.convert(value14);
  dynamicSize += (_uid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _capitalExplanation);
  writer.writeStringList(offsets[1], _categories);
  writer.writeDateTime(offsets[2], _dateTimeCreated);
  writer.writeDateTime(offsets[3], _dateTimeLastUpdated);
  writer.writeBytes(offsets[4], _differentiationExplanation);
  writer.writeBytes(offsets[5], _fullDescription);
  writer.writeDouble(offsets[6], _index);
  writer.writeLong(offsets[7], _rating);
  writer.writeBytes(offsets[8], _ratingQuestions);
  writer.writeBytes(offsets[9], _revenueExplanation);
  writer.writeBytes(offsets[10], _speedExplanation);
  writer.writeBytes(offsets[11], _status);
  writer.writeBytes(offsets[12], _summary);
  writer.writeBytes(offsets[13], _title);
  writer.writeBytes(offsets[14], _uid);
}

IsarIdea _isarIdeaDeserializeNative(IsarCollection<IsarIdea> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = IsarIdea();
  object.capitalExplanation = reader.readString(offsets[0]);
  object.categories = reader.readStringList(offsets[1]) ?? [];
  object.dateTimeCreated = reader.readDateTime(offsets[2]);
  object.dateTimeLastUpdated = reader.readDateTime(offsets[3]);
  object.differentiationExplanation = reader.readString(offsets[4]);
  object.fullDescription = reader.readString(offsets[5]);
  object.id = id;
  object.index = reader.readDouble(offsets[6]);
  object.rating = reader.readLong(offsets[7]);
  object.ratingQuestions = _isarIdeaIsarIdeaRatingQuestionConverter
      .fromIsar(reader.readString(offsets[8]));
  object.revenueExplanation = reader.readString(offsets[9]);
  object.speedExplanation = reader.readString(offsets[10]);
  object.status = reader.readString(offsets[11]);
  object.summary = reader.readString(offsets[12]);
  object.title = reader.readString(offsets[13]);
  object.uid = reader.readString(offsets[14]);
  return object;
}

P _isarIdeaDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_isarIdeaIsarIdeaRatingQuestionConverter
          .fromIsar(reader.readString(offset))) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarIdeaSerializeWeb(
    IsarCollection<IsarIdea> collection, IsarIdea object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'capitalExplanation', object.capitalExplanation);
  IsarNative.jsObjectSet(jsObj, 'categories', object.categories);
  IsarNative.jsObjectSet(jsObj, 'dateTimeCreated',
      object.dateTimeCreated.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'dateTimeLastUpdated',
      object.dateTimeLastUpdated.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'differentiationExplanation', object.differentiationExplanation);
  IsarNative.jsObjectSet(jsObj, 'fullDescription', object.fullDescription);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'rating', object.rating);
  IsarNative.jsObjectSet(jsObj, 'ratingQuestions',
      _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(object.ratingQuestions));
  IsarNative.jsObjectSet(
      jsObj, 'revenueExplanation', object.revenueExplanation);
  IsarNative.jsObjectSet(jsObj, 'speedExplanation', object.speedExplanation);
  IsarNative.jsObjectSet(jsObj, 'status', object.status);
  IsarNative.jsObjectSet(jsObj, 'summary', object.summary);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'uid', object.uid);
  return jsObj;
}

IsarIdea _isarIdeaDeserializeWeb(
    IsarCollection<IsarIdea> collection, dynamic jsObj) {
  final object = IsarIdea();
  object.capitalExplanation =
      IsarNative.jsObjectGet(jsObj, 'capitalExplanation') ?? '';
  object.categories = (IsarNative.jsObjectGet(jsObj, 'categories') as List?)
          ?.map((e) => e ?? '')
          .toList()
          .cast<String>() ??
      [];
  object.dateTimeCreated =
      IsarNative.jsObjectGet(jsObj, 'dateTimeCreated') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeCreated'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0);
  object.dateTimeLastUpdated =
      IsarNative.jsObjectGet(jsObj, 'dateTimeLastUpdated') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeLastUpdated'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0);
  object.differentiationExplanation =
      IsarNative.jsObjectGet(jsObj, 'differentiationExplanation') ?? '';
  object.fullDescription =
      IsarNative.jsObjectGet(jsObj, 'fullDescription') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.index =
      IsarNative.jsObjectGet(jsObj, 'index') ?? double.negativeInfinity;
  object.rating =
      IsarNative.jsObjectGet(jsObj, 'rating') ?? double.negativeInfinity;
  object.ratingQuestions = _isarIdeaIsarIdeaRatingQuestionConverter
      .fromIsar(IsarNative.jsObjectGet(jsObj, 'ratingQuestions') ?? '');
  object.revenueExplanation =
      IsarNative.jsObjectGet(jsObj, 'revenueExplanation') ?? '';
  object.speedExplanation =
      IsarNative.jsObjectGet(jsObj, 'speedExplanation') ?? '';
  object.status = IsarNative.jsObjectGet(jsObj, 'status') ?? '';
  object.summary = IsarNative.jsObjectGet(jsObj, 'summary') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  object.uid = IsarNative.jsObjectGet(jsObj, 'uid') ?? '';
  return object;
}

P _isarIdeaDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'capitalExplanation':
      return (IsarNative.jsObjectGet(jsObj, 'capitalExplanation') ?? '') as P;
    case 'categories':
      return ((IsarNative.jsObjectGet(jsObj, 'categories') as List?)
              ?.map((e) => e ?? '')
              .toList()
              .cast<String>() ??
          []) as P;
    case 'dateTimeCreated':
      return (IsarNative.jsObjectGet(jsObj, 'dateTimeCreated') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeCreated'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'dateTimeLastUpdated':
      return (IsarNative.jsObjectGet(jsObj, 'dateTimeLastUpdated') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTimeLastUpdated'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'differentiationExplanation':
      return (IsarNative.jsObjectGet(jsObj, 'differentiationExplanation') ?? '')
          as P;
    case 'fullDescription':
      return (IsarNative.jsObjectGet(jsObj, 'fullDescription') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index') ?? double.negativeInfinity)
          as P;
    case 'rating':
      return (IsarNative.jsObjectGet(jsObj, 'rating') ??
          double.negativeInfinity) as P;
    case 'ratingQuestions':
      return (_isarIdeaIsarIdeaRatingQuestionConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'ratingQuestions') ?? '')) as P;
    case 'revenueExplanation':
      return (IsarNative.jsObjectGet(jsObj, 'revenueExplanation') ?? '') as P;
    case 'speedExplanation':
      return (IsarNative.jsObjectGet(jsObj, 'speedExplanation') ?? '') as P;
    case 'status':
      return (IsarNative.jsObjectGet(jsObj, 'status') ?? '') as P;
    case 'summary':
      return (IsarNative.jsObjectGet(jsObj, 'summary') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'uid':
      return (IsarNative.jsObjectGet(jsObj, 'uid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarIdeaAttachLinks(IsarCollection col, int id, IsarIdea object) {}

extension IsarIdeaByIndex on IsarCollection<IsarIdea> {
  Future<IsarIdea?> getByUid(String uid) {
    return getByIndex('uid', [uid]);
  }

  IsarIdea? getByUidSync(String uid) {
    return getByIndexSync('uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex('uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync('uid', [uid]);
  }

  Future<List<IsarIdea?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex('uid', values);
  }

  List<IsarIdea?> getAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndexSync('uid', values);
  }

  Future<int> deleteAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndex('uid', values);
  }

  int deleteAllByUidSync(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uid', values);
  }
}

extension IsarIdeaQueryWhereSort on QueryBuilder<IsarIdea, IsarIdea, QWhere> {
  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyCategoriesAny() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'categories'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyDateTimeCreated() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'dateTimeCreated'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyDateTimeLastUpdated() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'dateTimeLastUpdated'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyFullDescription() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'fullDescription'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyIndex() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'index'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyRating() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'rating'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anySummary() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'summary'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhere> anyUid() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'uid'));
  }
}

extension IsarIdeaQueryWhere on QueryBuilder<IsarIdea, IsarIdea, QWhereClause> {
  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyEqualTo(
      String categoriesElement) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'categories',
      value: [categoriesElement],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyNotEqualTo(
      String categoriesElement) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'categories',
        upper: [categoriesElement],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'categories',
        lower: [categoriesElement],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'categories',
        lower: [categoriesElement],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'categories',
        upper: [categoriesElement],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyGreaterThan(
    String categoriesElement, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'categories',
      lower: [categoriesElement],
      includeLower: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyLessThan(
    String categoriesElement, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'categories',
      upper: [categoriesElement],
      includeUpper: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyBetween(
    String lowerCategoriesElement,
    String upperCategoriesElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'categories',
      lower: [lowerCategoriesElement],
      includeLower: includeLower,
      upper: [upperCategoriesElement],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> categoriesAnyStartsWith(
      String CategoriesElementPrefix) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'categories',
      lower: [CategoriesElementPrefix],
      includeLower: true,
      upper: ['$CategoriesElementPrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> dateTimeCreatedEqualTo(
      DateTime dateTimeCreated) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'dateTimeCreated',
      value: [dateTimeCreated],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> dateTimeCreatedNotEqualTo(
      DateTime dateTimeCreated) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'dateTimeCreated',
        upper: [dateTimeCreated],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'dateTimeCreated',
        lower: [dateTimeCreated],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'dateTimeCreated',
        lower: [dateTimeCreated],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'dateTimeCreated',
        upper: [dateTimeCreated],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeCreatedGreaterThan(
    DateTime dateTimeCreated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'dateTimeCreated',
      lower: [dateTimeCreated],
      includeLower: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> dateTimeCreatedLessThan(
    DateTime dateTimeCreated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'dateTimeCreated',
      upper: [dateTimeCreated],
      includeUpper: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> dateTimeCreatedBetween(
    DateTime lowerDateTimeCreated,
    DateTime upperDateTimeCreated, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'dateTimeCreated',
      lower: [lowerDateTimeCreated],
      includeLower: includeLower,
      upper: [upperDateTimeCreated],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeLastUpdatedEqualTo(DateTime dateTimeLastUpdated) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'dateTimeLastUpdated',
      value: [dateTimeLastUpdated],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeLastUpdatedNotEqualTo(DateTime dateTimeLastUpdated) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'dateTimeLastUpdated',
        upper: [dateTimeLastUpdated],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'dateTimeLastUpdated',
        lower: [dateTimeLastUpdated],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'dateTimeLastUpdated',
        lower: [dateTimeLastUpdated],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'dateTimeLastUpdated',
        upper: [dateTimeLastUpdated],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeLastUpdatedGreaterThan(
    DateTime dateTimeLastUpdated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'dateTimeLastUpdated',
      lower: [dateTimeLastUpdated],
      includeLower: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeLastUpdatedLessThan(
    DateTime dateTimeLastUpdated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'dateTimeLastUpdated',
      upper: [dateTimeLastUpdated],
      includeUpper: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause>
      dateTimeLastUpdatedBetween(
    DateTime lowerDateTimeLastUpdated,
    DateTime upperDateTimeLastUpdated, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'dateTimeLastUpdated',
      lower: [lowerDateTimeLastUpdated],
      includeLower: includeLower,
      upper: [upperDateTimeLastUpdated],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> fullDescriptionEqualTo(
      String fullDescription) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'fullDescription',
      value: [fullDescription],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> fullDescriptionNotEqualTo(
      String fullDescription) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'fullDescription',
        upper: [fullDescription],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'fullDescription',
        lower: [fullDescription],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'fullDescription',
        lower: [fullDescription],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'fullDescription',
        upper: [fullDescription],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> indexGreaterThan(
      double index) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'index',
      lower: [index],
      includeLower: false,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> indexLessThan(
      double index) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'index',
      upper: [index],
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> indexBetween(
      double lowerIndex, double upperIndex) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'index',
      lower: [lowerIndex],
      includeLower: false,
      upper: [upperIndex],
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> ratingEqualTo(
      int rating) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'rating',
      value: [rating],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> ratingNotEqualTo(
      int rating) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'rating',
        upper: [rating],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'rating',
        lower: [rating],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'rating',
        lower: [rating],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'rating',
        upper: [rating],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> ratingGreaterThan(
    int rating, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'rating',
      lower: [rating],
      includeLower: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> ratingLessThan(
    int rating, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'rating',
      upper: [rating],
      includeUpper: include,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> ratingBetween(
    int lowerRating,
    int upperRating, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'rating',
      lower: [lowerRating],
      includeLower: includeLower,
      upper: [upperRating],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> summaryEqualTo(
      String summary) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'summary',
      value: [summary],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> summaryNotEqualTo(
      String summary) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'summary',
        upper: [summary],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'summary',
        lower: [summary],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'summary',
        lower: [summary],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'summary',
        upper: [summary],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> titleEqualTo(
      String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> titleNotEqualTo(
      String title) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> uidEqualTo(String uid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uid',
      value: [uid],
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterWhereClause> uidNotEqualTo(
      String uid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uid',
        upper: [uid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uid',
        lower: [uid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uid',
        lower: [uid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uid',
        upper: [uid],
        includeUpper: false,
      ));
    }
  }
}

extension IsarIdeaQueryFilter
    on QueryBuilder<IsarIdea, IsarIdea, QFilterCondition> {
  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'capitalExplanation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'capitalExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      capitalExplanationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'capitalExplanation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      categoriesAnyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'categories',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      categoriesAnyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> categoriesAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categories',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeCreatedEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTimeCreated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeCreatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateTimeCreated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeCreatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateTimeCreated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeCreatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateTimeCreated',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeLastUpdatedEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTimeLastUpdated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeLastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateTimeLastUpdated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeLastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateTimeLastUpdated',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      dateTimeLastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateTimeLastUpdated',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'differentiationExplanation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationContains(String value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'differentiationExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      differentiationExplanationMatches(String pattern,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'differentiationExplanation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fullDescription',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fullDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      fullDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fullDescription',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> indexGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> indexLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> indexBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'index',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> ratingEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> ratingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> ratingLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> ratingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rating',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsEqualTo(
    List<IdeaRatingQuestion> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsGreaterThan(
    List<IdeaRatingQuestion> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsLessThan(
    List<IdeaRatingQuestion> value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsBetween(
    List<IdeaRatingQuestion> lower,
    List<IdeaRatingQuestion> upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'ratingQuestions',
      lower: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(upper),
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsStartsWith(
    List<IdeaRatingQuestion> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsEndsWith(
    List<IdeaRatingQuestion> value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsContains(List<IdeaRatingQuestion> value,
          {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ratingQuestions',
      value: _isarIdeaIsarIdeaRatingQuestionConverter.toIsar(value),
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      ratingQuestionsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ratingQuestions',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'revenueExplanation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'revenueExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      revenueExplanationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'revenueExplanation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'speedExplanation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'speedExplanation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition>
      speedExplanationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'speedExplanation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'status',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'status',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> statusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'status',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'summary',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'summary',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> summaryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'summary',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarIdeaQueryLinks
    on QueryBuilder<IsarIdea, IsarIdea, QFilterCondition> {}

extension IsarIdeaQueryWhereSortBy
    on QueryBuilder<IsarIdea, IsarIdea, QSortBy> {
  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByCapitalExplanation() {
    return addSortByInternal('capitalExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      sortByCapitalExplanationDesc() {
    return addSortByInternal('capitalExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByDateTimeCreated() {
    return addSortByInternal('dateTimeCreated', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByDateTimeCreatedDesc() {
    return addSortByInternal('dateTimeCreated', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByDateTimeLastUpdated() {
    return addSortByInternal('dateTimeLastUpdated', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      sortByDateTimeLastUpdatedDesc() {
    return addSortByInternal('dateTimeLastUpdated', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      sortByDifferentiationExplanation() {
    return addSortByInternal('differentiationExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      sortByDifferentiationExplanationDesc() {
    return addSortByInternal('differentiationExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByFullDescription() {
    return addSortByInternal('fullDescription', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByFullDescriptionDesc() {
    return addSortByInternal('fullDescription', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByRatingQuestions() {
    return addSortByInternal('ratingQuestions', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByRatingQuestionsDesc() {
    return addSortByInternal('ratingQuestions', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByRevenueExplanation() {
    return addSortByInternal('revenueExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      sortByRevenueExplanationDesc() {
    return addSortByInternal('revenueExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortBySpeedExplanation() {
    return addSortByInternal('speedExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortBySpeedExplanationDesc() {
    return addSortByInternal('speedExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortBySummary() {
    return addSortByInternal('summary', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortBySummaryDesc() {
    return addSortByInternal('summary', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> sortByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension IsarIdeaQueryWhereSortThenBy
    on QueryBuilder<IsarIdea, IsarIdea, QSortThenBy> {
  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByCapitalExplanation() {
    return addSortByInternal('capitalExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      thenByCapitalExplanationDesc() {
    return addSortByInternal('capitalExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByDateTimeCreated() {
    return addSortByInternal('dateTimeCreated', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByDateTimeCreatedDesc() {
    return addSortByInternal('dateTimeCreated', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByDateTimeLastUpdated() {
    return addSortByInternal('dateTimeLastUpdated', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      thenByDateTimeLastUpdatedDesc() {
    return addSortByInternal('dateTimeLastUpdated', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      thenByDifferentiationExplanation() {
    return addSortByInternal('differentiationExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      thenByDifferentiationExplanationDesc() {
    return addSortByInternal('differentiationExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByFullDescription() {
    return addSortByInternal('fullDescription', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByFullDescriptionDesc() {
    return addSortByInternal('fullDescription', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByRatingQuestions() {
    return addSortByInternal('ratingQuestions', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByRatingQuestionsDesc() {
    return addSortByInternal('ratingQuestions', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByRevenueExplanation() {
    return addSortByInternal('revenueExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy>
      thenByRevenueExplanationDesc() {
    return addSortByInternal('revenueExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenBySpeedExplanation() {
    return addSortByInternal('speedExplanation', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenBySpeedExplanationDesc() {
    return addSortByInternal('speedExplanation', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByStatus() {
    return addSortByInternal('status', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByStatusDesc() {
    return addSortByInternal('status', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenBySummary() {
    return addSortByInternal('summary', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenBySummaryDesc() {
    return addSortByInternal('summary', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<IsarIdea, IsarIdea, QAfterSortBy> thenByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension IsarIdeaQueryWhereDistinct
    on QueryBuilder<IsarIdea, IsarIdea, QDistinct> {
  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByCapitalExplanation(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('capitalExplanation',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByDateTimeCreated() {
    return addDistinctByInternal('dateTimeCreated');
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByDateTimeLastUpdated() {
    return addDistinctByInternal('dateTimeLastUpdated');
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct>
      distinctByDifferentiationExplanation({bool caseSensitive = true}) {
    return addDistinctByInternal('differentiationExplanation',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByFullDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fullDescription',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByRating() {
    return addDistinctByInternal('rating');
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByRatingQuestions(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('ratingQuestions',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByRevenueExplanation(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('revenueExplanation',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctBySpeedExplanation(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('speedExplanation',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('status', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctBySummary(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('summary', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdea, IsarIdea, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uid', caseSensitive: caseSensitive);
  }
}

extension IsarIdeaQueryProperty
    on QueryBuilder<IsarIdea, IsarIdea, QQueryProperty> {
  QueryBuilder<IsarIdea, String, QQueryOperations>
      capitalExplanationProperty() {
    return addPropertyNameInternal('capitalExplanation');
  }

  QueryBuilder<IsarIdea, List<String>, QQueryOperations> categoriesProperty() {
    return addPropertyNameInternal('categories');
  }

  QueryBuilder<IsarIdea, DateTime, QQueryOperations> dateTimeCreatedProperty() {
    return addPropertyNameInternal('dateTimeCreated');
  }

  QueryBuilder<IsarIdea, DateTime, QQueryOperations>
      dateTimeLastUpdatedProperty() {
    return addPropertyNameInternal('dateTimeLastUpdated');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations>
      differentiationExplanationProperty() {
    return addPropertyNameInternal('differentiationExplanation');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> fullDescriptionProperty() {
    return addPropertyNameInternal('fullDescription');
  }

  QueryBuilder<IsarIdea, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarIdea, double, QQueryOperations> indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<IsarIdea, int, QQueryOperations> ratingProperty() {
    return addPropertyNameInternal('rating');
  }

  QueryBuilder<IsarIdea, List<IdeaRatingQuestion>, QQueryOperations>
      ratingQuestionsProperty() {
    return addPropertyNameInternal('ratingQuestions');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations>
      revenueExplanationProperty() {
    return addPropertyNameInternal('revenueExplanation');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> speedExplanationProperty() {
    return addPropertyNameInternal('speedExplanation');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> statusProperty() {
    return addPropertyNameInternal('status');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> summaryProperty() {
    return addPropertyNameInternal('summary');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<IsarIdea, String, QQueryOperations> uidProperty() {
    return addPropertyNameInternal('uid');
  }
}
