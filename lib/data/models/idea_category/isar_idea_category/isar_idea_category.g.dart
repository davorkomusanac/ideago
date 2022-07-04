// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_idea_category.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarIdeaCategoryCollection on Isar {
  IsarCollection<IsarIdeaCategory> get isarIdeaCategorys => getCollection();
}

const IsarIdeaCategorySchema = CollectionSchema(
  name: 'IsarIdeaCategory',
  schema:
      '{"name":"IsarIdeaCategory","idName":"id","properties":[{"name":"title","type":"String"},{"name":"uid","type":"String"}],"indexes":[{"name":"title","unique":true,"properties":[{"name":"title","type":"Hash","caseSensitive":false}]},{"name":"uid","unique":true,"properties":[{"name":"uid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'title': 0, 'uid': 1},
  listProperties: {},
  indexIds: {'title': 0, 'uid': 1},
  indexValueTypes: {
    'title': [
      IndexValueType.stringHashCIS,
    ],
    'uid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarIdeaCategoryGetId,
  setId: _isarIdeaCategorySetId,
  getLinks: _isarIdeaCategoryGetLinks,
  attachLinks: _isarIdeaCategoryAttachLinks,
  serializeNative: _isarIdeaCategorySerializeNative,
  deserializeNative: _isarIdeaCategoryDeserializeNative,
  deserializePropNative: _isarIdeaCategoryDeserializePropNative,
  serializeWeb: _isarIdeaCategorySerializeWeb,
  deserializeWeb: _isarIdeaCategoryDeserializeWeb,
  deserializePropWeb: _isarIdeaCategoryDeserializePropWeb,
  version: 3,
);

int? _isarIdeaCategoryGetId(IsarIdeaCategory object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarIdeaCategorySetId(IsarIdeaCategory object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarIdeaCategoryGetLinks(IsarIdeaCategory object) {
  return [];
}

void _isarIdeaCategorySerializeNative(
    IsarCollection<IsarIdeaCategory> collection,
    IsarRawObject rawObj,
    IsarIdeaCategory object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_title.length) as int;
  final value1 = object.uid;
  final _uid = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_uid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _title);
  writer.writeBytes(offsets[1], _uid);
}

IsarIdeaCategory _isarIdeaCategoryDeserializeNative(
    IsarCollection<IsarIdeaCategory> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarIdeaCategory();
  object.id = id;
  object.title = reader.readString(offsets[0]);
  object.uid = reader.readString(offsets[1]);
  return object;
}

P _isarIdeaCategoryDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarIdeaCategorySerializeWeb(
    IsarCollection<IsarIdeaCategory> collection, IsarIdeaCategory object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'uid', object.uid);
  return jsObj;
}

IsarIdeaCategory _isarIdeaCategoryDeserializeWeb(
    IsarCollection<IsarIdeaCategory> collection, dynamic jsObj) {
  final object = IsarIdeaCategory();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  object.uid = IsarNative.jsObjectGet(jsObj, 'uid') ?? '';
  return object;
}

P _isarIdeaCategoryDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'uid':
      return (IsarNative.jsObjectGet(jsObj, 'uid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarIdeaCategoryAttachLinks(
    IsarCollection col, int id, IsarIdeaCategory object) {}

extension IsarIdeaCategoryByIndex on IsarCollection<IsarIdeaCategory> {
  Future<IsarIdeaCategory?> getByTitle(String title) {
    return getByIndex('title', [title]);
  }

  IsarIdeaCategory? getByTitleSync(String title) {
    return getByIndexSync('title', [title]);
  }

  Future<bool> deleteByTitle(String title) {
    return deleteByIndex('title', [title]);
  }

  bool deleteByTitleSync(String title) {
    return deleteByIndexSync('title', [title]);
  }

  Future<List<IsarIdeaCategory?>> getAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndex('title', values);
  }

  List<IsarIdeaCategory?> getAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return getAllByIndexSync('title', values);
  }

  Future<int> deleteAllByTitle(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndex('title', values);
  }

  int deleteAllByTitleSync(List<String> titleValues) {
    final values = titleValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('title', values);
  }

  Future<IsarIdeaCategory?> getByUid(String uid) {
    return getByIndex('uid', [uid]);
  }

  IsarIdeaCategory? getByUidSync(String uid) {
    return getByIndexSync('uid', [uid]);
  }

  Future<bool> deleteByUid(String uid) {
    return deleteByIndex('uid', [uid]);
  }

  bool deleteByUidSync(String uid) {
    return deleteByIndexSync('uid', [uid]);
  }

  Future<List<IsarIdeaCategory?>> getAllByUid(List<String> uidValues) {
    final values = uidValues.map((e) => [e]).toList();
    return getAllByIndex('uid', values);
  }

  List<IsarIdeaCategory?> getAllByUidSync(List<String> uidValues) {
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

extension IsarIdeaCategoryQueryWhereSort
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QWhere> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhere> anyUid() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'uid'));
  }
}

extension IsarIdeaCategoryQueryWhere
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QWhereClause> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      titleEqualTo(String title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      titleNotEqualTo(String title) {
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      uidEqualTo(String uid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uid',
      value: [uid],
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterWhereClause>
      uidNotEqualTo(String uid) {
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

extension IsarIdeaCategoryQueryFilter
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QFilterCondition> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidEqualTo(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidGreaterThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidLessThan(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidBetween(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidStartsWith(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidEndsWith(
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

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarIdeaCategoryQueryLinks
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QFilterCondition> {}

extension IsarIdeaCategoryQueryWhereSortBy
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QSortBy> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> sortByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      sortByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension IsarIdeaCategoryQueryWhereSortThenBy
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QSortThenBy> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy> thenByUid() {
    return addSortByInternal('uid', Sort.asc);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QAfterSortBy>
      thenByUidDesc() {
    return addSortByInternal('uid', Sort.desc);
  }
}

extension IsarIdeaCategoryQueryWhereDistinct
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QDistinct> {
  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uid', caseSensitive: caseSensitive);
  }
}

extension IsarIdeaCategoryQueryProperty
    on QueryBuilder<IsarIdeaCategory, IsarIdeaCategory, QQueryProperty> {
  QueryBuilder<IsarIdeaCategory, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarIdeaCategory, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<IsarIdeaCategory, String, QQueryOperations> uidProperty() {
    return addPropertyNameInternal('uid');
  }
}
