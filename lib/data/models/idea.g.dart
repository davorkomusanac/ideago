// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idea.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIdeaCollection on Isar {
  IsarCollection<Idea> get ideas => getCollection();
}

const IdeaSchema = CollectionSchema(
  name: 'Idea',
  schema:
      '{"name":"Idea","idName":"id","properties":[{"name":"categories","type":"StringList"},{"name":"dateTimeCreated","type":"Long"},{"name":"description","type":"String"},{"name":"hashCode","type":"Long"},{"name":"ideaStatus","type":"String"},{"name":"index","type":"Double"},{"name":"rating","type":"Long"},{"name":"stringify","type":"Bool"},{"name":"title","type":"String"}],"indexes":[{"name":"categories","unique":false,"properties":[{"name":"categories","type":"HashElements","caseSensitive":false}]},{"name":"dateTimeCreated","unique":false,"properties":[{"name":"dateTimeCreated","type":"Value","caseSensitive":false}]},{"name":"description","unique":false,"properties":[{"name":"description","type":"Hash","caseSensitive":false}]},{"name":"index","unique":false,"properties":[{"name":"index","type":"Value","caseSensitive":false}]},{"name":"rating","unique":false,"properties":[{"name":"rating","type":"Value","caseSensitive":false}]},{"name":"title","unique":false,"properties":[{"name":"title","type":"Hash","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'categories': 0,
    'dateTimeCreated': 1,
    'description': 2,
    'hashCode': 3,
    'ideaStatus': 4,
    'index': 5,
    'rating': 6,
    'stringify': 7,
    'title': 8
  },
  listProperties: {'categories'},
  indexIds: {
    'categories': 0,
    'dateTimeCreated': 1,
    'description': 2,
    'index': 3,
    'rating': 4,
    'title': 5
  },
  indexValueTypes: {
    'categories': [
      IndexValueType.stringHashCIS,
    ],
    'dateTimeCreated': [
      IndexValueType.long,
    ],
    'description': [
      IndexValueType.stringHashCIS,
    ],
    'index': [
      IndexValueType.double,
    ],
    'rating': [
      IndexValueType.long,
    ],
    'title': [
      IndexValueType.stringHashCIS,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _ideaGetId,
  getLinks: _ideaGetLinks,
  attachLinks: _ideaAttachLinks,
  serializeNative: _ideaSerializeNative,
  deserializeNative: _ideaDeserializeNative,
  deserializePropNative: _ideaDeserializePropNative,
  serializeWeb: _ideaSerializeWeb,
  deserializeWeb: _ideaDeserializeWeb,
  deserializePropWeb: _ideaDeserializePropWeb,
  version: 3,
);

int? _ideaGetId(Idea object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _ideaGetLinks(Idea object) {
  return [];
}

void _ideaSerializeNative(IsarCollection<Idea> collection, IsarRawObject rawObj,
    Idea object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.categories;
  dynamicSize += (value0.length) * 8;
  final bytesList0 = <IsarUint8List>[];
  for (var str in value0) {
    final bytes = IsarBinaryWriter.utf8Encoder.convert(str);
    bytesList0.add(bytes);
    dynamicSize += bytes.length as int;
  }
  final _categories = bytesList0;
  final value1 = object.dateTimeCreated;
  final _dateTimeCreated = value1;
  final value2 = object.description;
  final _description = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_description.length) as int;
  final value3 = object.hashCode;
  final _hashCode = value3;
  final value4 = object.ideaStatus;
  final _ideaStatus = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_ideaStatus.length) as int;
  final value5 = object.index;
  final _index = value5;
  final value6 = object.rating;
  final _rating = value6;
  final value7 = object.stringify;
  final _stringify = value7;
  final value8 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value8);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeStringList(offsets[0], _categories);
  writer.writeDateTime(offsets[1], _dateTimeCreated);
  writer.writeBytes(offsets[2], _description);
  writer.writeLong(offsets[3], _hashCode);
  writer.writeBytes(offsets[4], _ideaStatus);
  writer.writeDouble(offsets[5], _index);
  writer.writeLong(offsets[6], _rating);
  writer.writeBool(offsets[7], _stringify);
  writer.writeBytes(offsets[8], _title);
}

Idea _ideaDeserializeNative(IsarCollection<Idea> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Idea(
    categories: reader.readStringList(offsets[0]) ?? [],
    dateTimeCreated: reader.readDateTime(offsets[1]),
    description: reader.readString(offsets[2]),
    id: id,
    ideaStatus: reader.readString(offsets[4]),
    index: reader.readDouble(offsets[5]),
    rating: reader.readLong(offsets[6]),
    title: reader.readString(offsets[8]),
  );
  return object;
}

P _ideaDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _ideaSerializeWeb(IsarCollection<Idea> collection, Idea object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'categories', object.categories);
  IsarNative.jsObjectSet(jsObj, 'dateTimeCreated',
      object.dateTimeCreated.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'description', object.description);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'ideaStatus', object.ideaStatus);
  IsarNative.jsObjectSet(jsObj, 'index', object.index);
  IsarNative.jsObjectSet(jsObj, 'rating', object.rating);
  IsarNative.jsObjectSet(jsObj, 'stringify', object.stringify);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Idea _ideaDeserializeWeb(IsarCollection<Idea> collection, dynamic jsObj) {
  final object = Idea(
    categories: (IsarNative.jsObjectGet(jsObj, 'categories') as List?)
            ?.map((e) => e ?? '')
            .toList()
            .cast<String>() ??
        [],
    dateTimeCreated: IsarNative.jsObjectGet(jsObj, 'dateTimeCreated') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'dateTimeCreated'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    description: IsarNative.jsObjectGet(jsObj, 'description') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    ideaStatus: IsarNative.jsObjectGet(jsObj, 'ideaStatus') ?? '',
    index: IsarNative.jsObjectGet(jsObj, 'index') ?? double.negativeInfinity,
    rating: IsarNative.jsObjectGet(jsObj, 'rating') ?? double.negativeInfinity,
    title: IsarNative.jsObjectGet(jsObj, 'title') ?? '',
  );
  return object;
}

P _ideaDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
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
    case 'description':
      return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'ideaStatus':
      return (IsarNative.jsObjectGet(jsObj, 'ideaStatus') ?? '') as P;
    case 'index':
      return (IsarNative.jsObjectGet(jsObj, 'index') ?? double.negativeInfinity)
          as P;
    case 'rating':
      return (IsarNative.jsObjectGet(jsObj, 'rating') ??
          double.negativeInfinity) as P;
    case 'stringify':
      return (IsarNative.jsObjectGet(jsObj, 'stringify')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _ideaAttachLinks(IsarCollection col, int id, Idea object) {}

extension IdeaQueryWhereSort on QueryBuilder<Idea, Idea, QWhere> {
  QueryBuilder<Idea, Idea, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyCategoriesAny() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'categories'));
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyDateTimeCreated() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'dateTimeCreated'));
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyDescription() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'description'));
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyIndex() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'index'));
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyRating() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'rating'));
  }

  QueryBuilder<Idea, Idea, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }
}

extension IdeaQueryWhere on QueryBuilder<Idea, Idea, QWhereClause> {
  QueryBuilder<Idea, Idea, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> idBetween(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyEqualTo(
      String categoriesElement) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'categories',
      value: [categoriesElement],
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyNotEqualTo(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyGreaterThan(
    String categoriesElement, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'categories',
      lower: [categoriesElement],
      includeLower: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyLessThan(
    String categoriesElement, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'categories',
      upper: [categoriesElement],
      includeUpper: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyBetween(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> categoriesAnyStartsWith(
      String CategoriesElementPrefix) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'categories',
      lower: [CategoriesElementPrefix],
      includeLower: true,
      upper: ['$CategoriesElementPrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> dateTimeCreatedEqualTo(
      DateTime dateTimeCreated) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'dateTimeCreated',
      value: [dateTimeCreated],
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> dateTimeCreatedNotEqualTo(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> dateTimeCreatedGreaterThan(
    DateTime dateTimeCreated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'dateTimeCreated',
      lower: [dateTimeCreated],
      includeLower: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> dateTimeCreatedLessThan(
    DateTime dateTimeCreated, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'dateTimeCreated',
      upper: [dateTimeCreated],
      includeUpper: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> dateTimeCreatedBetween(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> descriptionEqualTo(
      String description) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'description',
      value: [description],
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> descriptionNotEqualTo(
      String description) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'description',
        upper: [description],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'description',
        lower: [description],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'description',
        lower: [description],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'description',
        upper: [description],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> indexGreaterThan(double index) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'index',
      lower: [index],
      includeLower: false,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> indexLessThan(double index) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'index',
      upper: [index],
      includeUpper: false,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> indexBetween(
      double lowerIndex, double upperIndex) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'index',
      lower: [lowerIndex],
      includeLower: false,
      upper: [upperIndex],
      includeUpper: false,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> ratingEqualTo(int rating) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'rating',
      value: [rating],
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> ratingNotEqualTo(int rating) {
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> ratingGreaterThan(
    int rating, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'rating',
      lower: [rating],
      includeLower: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> ratingLessThan(
    int rating, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'rating',
      upper: [rating],
      includeUpper: include,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> ratingBetween(
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

  QueryBuilder<Idea, Idea, QAfterWhereClause> titleEqualTo(String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<Idea, Idea, QAfterWhereClause> titleNotEqualTo(String title) {
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
}

extension IdeaQueryFilter on QueryBuilder<Idea, Idea, QFilterCondition> {
  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyEqualTo(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyGreaterThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyLessThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyBetween(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyStartsWith(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyEndsWith(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'categories',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> categoriesAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'categories',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> dateTimeCreatedEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTimeCreated',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> dateTimeCreatedGreaterThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> dateTimeCreatedLessThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> dateTimeCreatedBetween(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'ideaStatus',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ideaStatus',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ideaStatusMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ideaStatus',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> indexGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> indexLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'index',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> indexBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'index',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ratingEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rating',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ratingGreaterThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ratingLessThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> ratingBetween(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> stringifyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'stringify',
      value: null,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> stringifyEqualTo(
      bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stringify',
      value: value,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Idea, Idea, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IdeaQueryLinks on QueryBuilder<Idea, Idea, QFilterCondition> {}

extension IdeaQueryWhereSortBy on QueryBuilder<Idea, Idea, QSortBy> {
  QueryBuilder<Idea, Idea, QAfterSortBy> sortByDateTimeCreated() {
    return addSortByInternal('dateTimeCreated', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByDateTimeCreatedDesc() {
    return addSortByInternal('dateTimeCreated', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByIdeaStatus() {
    return addSortByInternal('ideaStatus', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByIdeaStatusDesc() {
    return addSortByInternal('ideaStatus', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IdeaQueryWhereSortThenBy on QueryBuilder<Idea, Idea, QSortThenBy> {
  QueryBuilder<Idea, Idea, QAfterSortBy> thenByDateTimeCreated() {
    return addSortByInternal('dateTimeCreated', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByDateTimeCreatedDesc() {
    return addSortByInternal('dateTimeCreated', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByIdeaStatus() {
    return addSortByInternal('ideaStatus', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByIdeaStatusDesc() {
    return addSortByInternal('ideaStatus', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByIndex() {
    return addSortByInternal('index', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByIndexDesc() {
    return addSortByInternal('index', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByRating() {
    return addSortByInternal('rating', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByRatingDesc() {
    return addSortByInternal('rating', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByStringify() {
    return addSortByInternal('stringify', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByStringifyDesc() {
    return addSortByInternal('stringify', Sort.desc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Idea, Idea, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension IdeaQueryWhereDistinct on QueryBuilder<Idea, Idea, QDistinct> {
  QueryBuilder<Idea, Idea, QDistinct> distinctByDateTimeCreated() {
    return addDistinctByInternal('dateTimeCreated');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByIdeaStatus(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('ideaStatus', caseSensitive: caseSensitive);
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByIndex() {
    return addDistinctByInternal('index');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByRating() {
    return addDistinctByInternal('rating');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByStringify() {
    return addDistinctByInternal('stringify');
  }

  QueryBuilder<Idea, Idea, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension IdeaQueryProperty on QueryBuilder<Idea, Idea, QQueryProperty> {
  QueryBuilder<Idea, List<String>, QQueryOperations> categoriesProperty() {
    return addPropertyNameInternal('categories');
  }

  QueryBuilder<Idea, DateTime, QQueryOperations> dateTimeCreatedProperty() {
    return addPropertyNameInternal('dateTimeCreated');
  }

  QueryBuilder<Idea, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Idea, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Idea, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Idea, String, QQueryOperations> ideaStatusProperty() {
    return addPropertyNameInternal('ideaStatus');
  }

  QueryBuilder<Idea, double, QQueryOperations> indexProperty() {
    return addPropertyNameInternal('index');
  }

  QueryBuilder<Idea, int, QQueryOperations> ratingProperty() {
    return addPropertyNameInternal('rating');
  }

  QueryBuilder<Idea, bool?, QQueryOperations> stringifyProperty() {
    return addPropertyNameInternal('stringify');
  }

  QueryBuilder<Idea, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
