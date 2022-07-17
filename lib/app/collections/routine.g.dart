// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetRoutineCollection on Isar {
  IsarCollection<Routine> get routines => getCollection();
}

const RoutineSchema = CollectionSchema(
  name: 'Routine',
  schema:
      '{"name":"Routine","idName":"id","properties":[{"name":"day","type":"String"},{"name":"startTimeRoutine","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"day","unique":false,"properties":[{"name":"day","type":"Hash","caseSensitive":false}]},{"name":"startTimeRoutine","unique":false,"properties":[{"name":"startTimeRoutine","type":"Hash","caseSensitive":true}]}],"links":[{"name":"category","target":"Category"}]}',
  idName: 'id',
  propertyIds: {'day': 0, 'startTimeRoutine': 1, 'title': 2},
  listProperties: {},
  indexIds: {'day': 0, 'startTimeRoutine': 1},
  indexValueTypes: {
    'day': [
      IndexValueType.stringHashCIS,
    ],
    'startTimeRoutine': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'category': 0},
  backlinkLinkNames: {},
  getId: _routineGetId,
  setId: _routineSetId,
  getLinks: _routineGetLinks,
  attachLinks: _routineAttachLinks,
  serializeNative: _routineSerializeNative,
  deserializeNative: _routineDeserializeNative,
  deserializePropNative: _routineDeserializePropNative,
  serializeWeb: _routineSerializeWeb,
  deserializeWeb: _routineDeserializeWeb,
  deserializePropWeb: _routineDeserializePropWeb,
  version: 3,
);

int? _routineGetId(Routine object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _routineSetId(Routine object, int id) {
  object.id = id;
}

List<IsarLinkBase> _routineGetLinks(Routine object) {
  return [object.category];
}

void _routineSerializeNative(
    IsarCollection<Routine> collection,
    IsarRawObject rawObj,
    Routine object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.day;
  final _day = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_day.length) as int;
  final value1 = object.startTimeRoutine;
  final _startTimeRoutine = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_startTimeRoutine.length) as int;
  final value2 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_title.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _day);
  writer.writeBytes(offsets[1], _startTimeRoutine);
  writer.writeBytes(offsets[2], _title);
}

Routine _routineDeserializeNative(IsarCollection<Routine> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Routine();
  object.day = reader.readString(offsets[0]);
  object.id = id;
  object.startTimeRoutine = reader.readString(offsets[1]);
  object.title = reader.readString(offsets[2]);
  _routineAttachLinks(collection, id, object);
  return object;
}

P _routineDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _routineSerializeWeb(
    IsarCollection<Routine> collection, Routine object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'day', object.day);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'startTimeRoutine', object.startTimeRoutine);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  return jsObj;
}

Routine _routineDeserializeWeb(
    IsarCollection<Routine> collection, dynamic jsObj) {
  final object = Routine();
  object.day = IsarNative.jsObjectGet(jsObj, 'day') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.startTimeRoutine =
      IsarNative.jsObjectGet(jsObj, 'startTimeRoutine') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  _routineAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _routineDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'day':
      return (IsarNative.jsObjectGet(jsObj, 'day') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'startTimeRoutine':
      return (IsarNative.jsObjectGet(jsObj, 'startTimeRoutine') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _routineAttachLinks(IsarCollection col, int id, Routine object) {
  object.category.attach(col, col.isar.categorys, 'category', id);
}

extension RoutineQueryWhereSort on QueryBuilder<Routine, Routine, QWhere> {
  QueryBuilder<Routine, Routine, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Routine, Routine, QAfterWhere> anyDay() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'day'));
  }

  QueryBuilder<Routine, Routine, QAfterWhere> anyStartTimeRoutine() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'startTimeRoutine'));
  }
}

extension RoutineQueryWhere on QueryBuilder<Routine, Routine, QWhereClause> {
  QueryBuilder<Routine, Routine, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Routine, Routine, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> idBetween(
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

  QueryBuilder<Routine, Routine, QAfterWhereClause> dayEqualTo(String day) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'day',
      value: [day],
    ));
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> dayNotEqualTo(String day) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'day',
        upper: [day],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'day',
        lower: [day],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'day',
        lower: [day],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'day',
        upper: [day],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> startTimeRoutineEqualTo(
      String startTimeRoutine) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'startTimeRoutine',
      value: [startTimeRoutine],
    ));
  }

  QueryBuilder<Routine, Routine, QAfterWhereClause> startTimeRoutineNotEqualTo(
      String startTimeRoutine) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'startTimeRoutine',
        upper: [startTimeRoutine],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'startTimeRoutine',
        lower: [startTimeRoutine],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'startTimeRoutine',
        lower: [startTimeRoutine],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'startTimeRoutine',
        upper: [startTimeRoutine],
        includeUpper: false,
      ));
    }
  }
}

extension RoutineQueryFilter
    on QueryBuilder<Routine, Routine, QFilterCondition> {
  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'day',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> dayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'day',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> startTimeRoutineEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      startTimeRoutineGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      startTimeRoutineLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> startTimeRoutineBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'startTimeRoutine',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      startTimeRoutineStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      startTimeRoutineEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition>
      startTimeRoutineContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'startTimeRoutine',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> startTimeRoutineMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'startTimeRoutine',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Routine, Routine, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension RoutineQueryLinks
    on QueryBuilder<Routine, Routine, QFilterCondition> {
  QueryBuilder<Routine, Routine, QAfterFilterCondition> category(
      FilterQuery<Category> q) {
    return linkInternal(
      isar.categorys,
      q,
      'category',
    );
  }
}

extension RoutineQueryWhereSortBy on QueryBuilder<Routine, Routine, QSortBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy> sortByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByStartTimeRoutine() {
    return addSortByInternal('startTimeRoutine', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByStartTimeRoutineDesc() {
    return addSortByInternal('startTimeRoutine', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension RoutineQueryWhereSortThenBy
    on QueryBuilder<Routine, Routine, QSortThenBy> {
  QueryBuilder<Routine, Routine, QAfterSortBy> thenByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByStartTimeRoutine() {
    return addSortByInternal('startTimeRoutine', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByStartTimeRoutineDesc() {
    return addSortByInternal('startTimeRoutine', Sort.desc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Routine, Routine, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension RoutineQueryWhereDistinct
    on QueryBuilder<Routine, Routine, QDistinct> {
  QueryBuilder<Routine, Routine, QDistinct> distinctByDay(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('day', caseSensitive: caseSensitive);
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByStartTimeRoutine(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('startTimeRoutine',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Routine, Routine, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension RoutineQueryProperty
    on QueryBuilder<Routine, Routine, QQueryProperty> {
  QueryBuilder<Routine, String, QQueryOperations> dayProperty() {
    return addPropertyNameInternal('day');
  }

  QueryBuilder<Routine, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Routine, String, QQueryOperations> startTimeRoutineProperty() {
    return addPropertyNameInternal('startTimeRoutine');
  }

  QueryBuilder<Routine, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
