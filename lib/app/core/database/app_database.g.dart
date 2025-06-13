// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TopicsTable extends Topics with TableInfo<$TopicsTable, Topic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(Insertable<Topic> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Topic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Topic(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class Topic extends DataClass implements Insertable<Topic> {
  final String id;
  final String name;
  final String description;
  const Topic(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory Topic.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Topic(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Topic copyWith({String? id, String? name, String? description}) => Topic(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  Topic copyWithCompanion(TopicsCompanion data) {
    return Topic(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Topic(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class TopicsCompanion extends UpdateCompanion<Topic> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> rowid;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TopicsCompanion.insert({
    required String id,
    required String name,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description);
  static Insertable<Topic> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TopicsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? rowid}) {
    return TopicsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hintMeta = const VerificationMeta('hint');
  @override
  late final GeneratedColumn<String> hint = GeneratedColumn<String>(
      'hint', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _topicIdMeta =
      const VerificationMeta('topicId');
  @override
  late final GeneratedColumn<String> topicId = GeneratedColumn<String>(
      'topic_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES topics (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, question, description, hint, topicId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(Insertable<Question> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('hint')) {
      context.handle(
          _hintMeta, hint.isAcceptableOrUnknown(data['hint']!, _hintMeta));
    } else if (isInserting) {
      context.missing(_hintMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(_topicIdMeta,
          topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta));
    } else if (isInserting) {
      context.missing(_topicIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      hint: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hint'])!,
      topicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic_id'])!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final String id;
  final String question;
  final String description;
  final String hint;
  final String topicId;
  const Question(
      {required this.id,
      required this.question,
      required this.description,
      required this.hint,
      required this.topicId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['question'] = Variable<String>(question);
    map['description'] = Variable<String>(description);
    map['hint'] = Variable<String>(hint);
    map['topic_id'] = Variable<String>(topicId);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      question: Value(question),
      description: Value(description),
      hint: Value(hint),
      topicId: Value(topicId),
    );
  }

  factory Question.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<String>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      description: serializer.fromJson<String>(json['description']),
      hint: serializer.fromJson<String>(json['hint']),
      topicId: serializer.fromJson<String>(json['topicId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'question': serializer.toJson<String>(question),
      'description': serializer.toJson<String>(description),
      'hint': serializer.toJson<String>(hint),
      'topicId': serializer.toJson<String>(topicId),
    };
  }

  Question copyWith(
          {String? id,
          String? question,
          String? description,
          String? hint,
          String? topicId}) =>
      Question(
        id: id ?? this.id,
        question: question ?? this.question,
        description: description ?? this.description,
        hint: hint ?? this.hint,
        topicId: topicId ?? this.topicId,
      );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      description:
          data.description.present ? data.description.value : this.description,
      hint: data.hint.present ? data.hint.value : this.hint,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('description: $description, ')
          ..write('hint: $hint, ')
          ..write('topicId: $topicId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, question, description, hint, topicId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.question == this.question &&
          other.description == this.description &&
          other.hint == this.hint &&
          other.topicId == this.topicId);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<String> id;
  final Value<String> question;
  final Value<String> description;
  final Value<String> hint;
  final Value<String> topicId;
  final Value<int> rowid;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.description = const Value.absent(),
    this.hint = const Value.absent(),
    this.topicId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestionsCompanion.insert({
    required String id,
    required String question,
    required String description,
    required String hint,
    required String topicId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        question = Value(question),
        description = Value(description),
        hint = Value(hint),
        topicId = Value(topicId);
  static Insertable<Question> custom({
    Expression<String>? id,
    Expression<String>? question,
    Expression<String>? description,
    Expression<String>? hint,
    Expression<String>? topicId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (description != null) 'description': description,
      if (hint != null) 'hint': hint,
      if (topicId != null) 'topic_id': topicId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? question,
      Value<String>? description,
      Value<String>? hint,
      Value<String>? topicId,
      Value<int>? rowid}) {
    return QuestionsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      description: description ?? this.description,
      hint: hint ?? this.hint,
      topicId: topicId ?? this.topicId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (hint.present) {
      map['hint'] = Variable<String>(hint.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<String>(topicId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('description: $description, ')
          ..write('hint: $hint, ')
          ..write('topicId: $topicId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnswersTable extends Answers with TableInfo<$AnswersTable, Answer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
      'question_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES questions (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, answer, isCorrect, questionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answers';
  @override
  VerificationContext validateIntegrity(Insertable<Answer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Answer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Answer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question_id'])!,
    );
  }

  @override
  $AnswersTable createAlias(String alias) {
    return $AnswersTable(attachedDatabase, alias);
  }
}

class Answer extends DataClass implements Insertable<Answer> {
  final String id;
  final String answer;
  final bool isCorrect;
  final String questionId;
  const Answer(
      {required this.id,
      required this.answer,
      required this.isCorrect,
      required this.questionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['answer'] = Variable<String>(answer);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['question_id'] = Variable<String>(questionId);
    return map;
  }

  AnswersCompanion toCompanion(bool nullToAbsent) {
    return AnswersCompanion(
      id: Value(id),
      answer: Value(answer),
      isCorrect: Value(isCorrect),
      questionId: Value(questionId),
    );
  }

  factory Answer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Answer(
      id: serializer.fromJson<String>(json['id']),
      answer: serializer.fromJson<String>(json['answer']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      questionId: serializer.fromJson<String>(json['questionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'answer': serializer.toJson<String>(answer),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'questionId': serializer.toJson<String>(questionId),
    };
  }

  Answer copyWith(
          {String? id, String? answer, bool? isCorrect, String? questionId}) =>
      Answer(
        id: id ?? this.id,
        answer: answer ?? this.answer,
        isCorrect: isCorrect ?? this.isCorrect,
        questionId: questionId ?? this.questionId,
      );
  Answer copyWithCompanion(AnswersCompanion data) {
    return Answer(
      id: data.id.present ? data.id.value : this.id,
      answer: data.answer.present ? data.answer.value : this.answer,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Answer(')
          ..write('id: $id, ')
          ..write('answer: $answer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('questionId: $questionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, answer, isCorrect, questionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Answer &&
          other.id == this.id &&
          other.answer == this.answer &&
          other.isCorrect == this.isCorrect &&
          other.questionId == this.questionId);
}

class AnswersCompanion extends UpdateCompanion<Answer> {
  final Value<String> id;
  final Value<String> answer;
  final Value<bool> isCorrect;
  final Value<String> questionId;
  final Value<int> rowid;
  const AnswersCompanion({
    this.id = const Value.absent(),
    this.answer = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.questionId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnswersCompanion.insert({
    required String id,
    required String answer,
    required bool isCorrect,
    required String questionId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        answer = Value(answer),
        isCorrect = Value(isCorrect),
        questionId = Value(questionId);
  static Insertable<Answer> custom({
    Expression<String>? id,
    Expression<String>? answer,
    Expression<bool>? isCorrect,
    Expression<String>? questionId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (answer != null) 'answer': answer,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (questionId != null) 'question_id': questionId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnswersCompanion copyWith(
      {Value<String>? id,
      Value<String>? answer,
      Value<bool>? isCorrect,
      Value<String>? questionId,
      Value<int>? rowid}) {
    return AnswersCompanion(
      id: id ?? this.id,
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
      questionId: questionId ?? this.questionId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnswersCompanion(')
          ..write('id: $id, ')
          ..write('answer: $answer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('questionId: $questionId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnsweredQuestionsTable extends AnsweredQuestions
    with TableInfo<$AnsweredQuestionsTable, AnsweredQuestion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnsweredQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
      'question_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerIdMeta =
      const VerificationMeta('answerId');
  @override
  late final GeneratedColumn<String> answerId = GeneratedColumn<String>(
      'answer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _answeredAtMeta =
      const VerificationMeta('answeredAt');
  @override
  late final GeneratedColumnWithTypeConverter<DateTime, DateTime> answeredAt =
      GeneratedColumn<DateTime>('answered_at', aliasedName, false,
              type: DriftSqlType.dateTime, requiredDuringInsert: true)
          .withConverter<DateTime>(
              $AnsweredQuestionsTable.$converteransweredAt);
  @override
  List<GeneratedColumn> get $columns =>
      [questionId, question, answerId, answer, isCorrect, answeredAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'answered_questions';
  @override
  VerificationContext validateIntegrity(Insertable<AnsweredQuestion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer_id')) {
      context.handle(_answerIdMeta,
          answerId.isAcceptableOrUnknown(data['answer_id']!, _answerIdMeta));
    } else if (isInserting) {
      context.missing(_answerIdMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    context.handle(_answeredAtMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {questionId};
  @override
  AnsweredQuestion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnsweredQuestion(
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question_id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      answerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer_id'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      answeredAt: $AnsweredQuestionsTable.$converteransweredAt.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.dateTime, data['${effectivePrefix}answered_at'])!),
    );
  }

  @override
  $AnsweredQuestionsTable createAlias(String alias) {
    return $AnsweredQuestionsTable(attachedDatabase, alias);
  }

  static TypeConverter<DateTime, DateTime> $converteransweredAt =
      DBDateTimeUtcConverter();
}

class AnsweredQuestion extends DataClass
    implements Insertable<AnsweredQuestion> {
  final String questionId;
  final String question;
  final String answerId;
  final String answer;
  final bool isCorrect;
  final DateTime answeredAt;
  const AnsweredQuestion(
      {required this.questionId,
      required this.question,
      required this.answerId,
      required this.answer,
      required this.isCorrect,
      required this.answeredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['question_id'] = Variable<String>(questionId);
    map['question'] = Variable<String>(question);
    map['answer_id'] = Variable<String>(answerId);
    map['answer'] = Variable<String>(answer);
    map['is_correct'] = Variable<bool>(isCorrect);
    {
      map['answered_at'] = Variable<DateTime>(
          $AnsweredQuestionsTable.$converteransweredAt.toSql(answeredAt));
    }
    return map;
  }

  AnsweredQuestionsCompanion toCompanion(bool nullToAbsent) {
    return AnsweredQuestionsCompanion(
      questionId: Value(questionId),
      question: Value(question),
      answerId: Value(answerId),
      answer: Value(answer),
      isCorrect: Value(isCorrect),
      answeredAt: Value(answeredAt),
    );
  }

  factory AnsweredQuestion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnsweredQuestion(
      questionId: serializer.fromJson<String>(json['questionId']),
      question: serializer.fromJson<String>(json['question']),
      answerId: serializer.fromJson<String>(json['answerId']),
      answer: serializer.fromJson<String>(json['answer']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'questionId': serializer.toJson<String>(questionId),
      'question': serializer.toJson<String>(question),
      'answerId': serializer.toJson<String>(answerId),
      'answer': serializer.toJson<String>(answer),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  AnsweredQuestion copyWith(
          {String? questionId,
          String? question,
          String? answerId,
          String? answer,
          bool? isCorrect,
          DateTime? answeredAt}) =>
      AnsweredQuestion(
        questionId: questionId ?? this.questionId,
        question: question ?? this.question,
        answerId: answerId ?? this.answerId,
        answer: answer ?? this.answer,
        isCorrect: isCorrect ?? this.isCorrect,
        answeredAt: answeredAt ?? this.answeredAt,
      );
  AnsweredQuestion copyWithCompanion(AnsweredQuestionsCompanion data) {
    return AnsweredQuestion(
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      question: data.question.present ? data.question.value : this.question,
      answerId: data.answerId.present ? data.answerId.value : this.answerId,
      answer: data.answer.present ? data.answer.value : this.answer,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      answeredAt:
          data.answeredAt.present ? data.answeredAt.value : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnsweredQuestion(')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('answerId: $answerId, ')
          ..write('answer: $answer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      questionId, question, answerId, answer, isCorrect, answeredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnsweredQuestion &&
          other.questionId == this.questionId &&
          other.question == this.question &&
          other.answerId == this.answerId &&
          other.answer == this.answer &&
          other.isCorrect == this.isCorrect &&
          other.answeredAt == this.answeredAt);
}

class AnsweredQuestionsCompanion extends UpdateCompanion<AnsweredQuestion> {
  final Value<String> questionId;
  final Value<String> question;
  final Value<String> answerId;
  final Value<String> answer;
  final Value<bool> isCorrect;
  final Value<DateTime> answeredAt;
  final Value<int> rowid;
  const AnsweredQuestionsCompanion({
    this.questionId = const Value.absent(),
    this.question = const Value.absent(),
    this.answerId = const Value.absent(),
    this.answer = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.answeredAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnsweredQuestionsCompanion.insert({
    required String questionId,
    required String question,
    required String answerId,
    required String answer,
    required bool isCorrect,
    required DateTime answeredAt,
    this.rowid = const Value.absent(),
  })  : questionId = Value(questionId),
        question = Value(question),
        answerId = Value(answerId),
        answer = Value(answer),
        isCorrect = Value(isCorrect),
        answeredAt = Value(answeredAt);
  static Insertable<AnsweredQuestion> custom({
    Expression<String>? questionId,
    Expression<String>? question,
    Expression<String>? answerId,
    Expression<String>? answer,
    Expression<bool>? isCorrect,
    Expression<DateTime>? answeredAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (questionId != null) 'question_id': questionId,
      if (question != null) 'question': question,
      if (answerId != null) 'answer_id': answerId,
      if (answer != null) 'answer': answer,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (answeredAt != null) 'answered_at': answeredAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnsweredQuestionsCompanion copyWith(
      {Value<String>? questionId,
      Value<String>? question,
      Value<String>? answerId,
      Value<String>? answer,
      Value<bool>? isCorrect,
      Value<DateTime>? answeredAt,
      Value<int>? rowid}) {
    return AnsweredQuestionsCompanion(
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      answerId: answerId ?? this.answerId,
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
      answeredAt: answeredAt ?? this.answeredAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answerId.present) {
      map['answer_id'] = Variable<String>(answerId.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(
          $AnsweredQuestionsTable.$converteransweredAt.toSql(answeredAt.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnsweredQuestionsCompanion(')
          ..write('questionId: $questionId, ')
          ..write('question: $question, ')
          ..write('answerId: $answerId, ')
          ..write('answer: $answer, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $AnswersTable answers = $AnswersTable(this);
  late final $AnsweredQuestionsTable answeredQuestions =
      $AnsweredQuestionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [topics, questions, answers, answeredQuestions];
}

typedef $$TopicsTableCreateCompanionBuilder = TopicsCompanion Function({
  required String id,
  required String name,
  required String description,
  Value<int> rowid,
});
typedef $$TopicsTableUpdateCompanionBuilder = TopicsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<int> rowid,
});

final class $$TopicsTableReferences
    extends BaseReferences<_$AppDatabase, $TopicsTable, Topic> {
  $$TopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestionsTable, List<Question>>
      _questionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.questions,
          aliasName: $_aliasNameGenerator(db.topics.id, db.questions.topicId));

  $$QuestionsTableProcessedTableManager get questionsRefs {
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.topicId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_questionsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  Expression<bool> questionsRefs(
      Expression<bool> Function($$QuestionsTableFilterComposer f) f) {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.topicId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  Expression<T> questionsRefs<T extends Object>(
      Expression<T> Function($$QuestionsTableAnnotationComposer a) f) {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.topicId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TopicsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TopicsTable,
    Topic,
    $$TopicsTableFilterComposer,
    $$TopicsTableOrderingComposer,
    $$TopicsTableAnnotationComposer,
    $$TopicsTableCreateCompanionBuilder,
    $$TopicsTableUpdateCompanionBuilder,
    (Topic, $$TopicsTableReferences),
    Topic,
    PrefetchHooks Function({bool questionsRefs})> {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TopicsCompanion(
            id: id,
            name: name,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            Value<int> rowid = const Value.absent(),
          }) =>
              TopicsCompanion.insert(
            id: id,
            name: name,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$TopicsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({questionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (questionsRefs) db.questions],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (questionsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TopicsTableReferences._questionsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TopicsTableReferences(db, table, p0)
                                .questionsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.topicId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TopicsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TopicsTable,
    Topic,
    $$TopicsTableFilterComposer,
    $$TopicsTableOrderingComposer,
    $$TopicsTableAnnotationComposer,
    $$TopicsTableCreateCompanionBuilder,
    $$TopicsTableUpdateCompanionBuilder,
    (Topic, $$TopicsTableReferences),
    Topic,
    PrefetchHooks Function({bool questionsRefs})>;
typedef $$QuestionsTableCreateCompanionBuilder = QuestionsCompanion Function({
  required String id,
  required String question,
  required String description,
  required String hint,
  required String topicId,
  Value<int> rowid,
});
typedef $$QuestionsTableUpdateCompanionBuilder = QuestionsCompanion Function({
  Value<String> id,
  Value<String> question,
  Value<String> description,
  Value<String> hint,
  Value<String> topicId,
  Value<int> rowid,
});

final class $$QuestionsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) => db.topics
      .createAlias($_aliasNameGenerator(db.questions.topicId, db.topics.id));

  $$TopicsTableProcessedTableManager get topicId {
    final manager = $$TopicsTableTableManager($_db, $_db.topics)
        .filter((f) => f.id($_item.topicId));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$AnswersTable, List<Answer>> _answersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.answers,
          aliasName:
              $_aliasNameGenerator(db.questions.id, db.answers.questionId));

  $$AnswersTableProcessedTableManager get answersRefs {
    final manager = $$AnswersTableTableManager($_db, $_db.answers)
        .filter((f) => f.questionId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_answersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hint => $composableBuilder(
      column: $table.hint, builder: (column) => ColumnFilters(column));

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.topicId,
        referencedTable: $db.topics,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicsTableFilterComposer(
              $db: $db,
              $table: $db.topics,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> answersRefs(
      Expression<bool> Function($$AnswersTableFilterComposer f) f) {
    final $$AnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableFilterComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hint => $composableBuilder(
      column: $table.hint, builder: (column) => ColumnOrderings(column));

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.topicId,
        referencedTable: $db.topics,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicsTableOrderingComposer(
              $db: $db,
              $table: $db.topics,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get hint =>
      $composableBuilder(column: $table.hint, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.topicId,
        referencedTable: $db.topics,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TopicsTableAnnotationComposer(
              $db: $db,
              $table: $db.topics,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> answersRefs<T extends Object>(
      Expression<T> Function($$AnswersTableAnnotationComposer a) f) {
    final $$AnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.answers,
        getReferencedColumn: (t) => t.questionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.answers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool topicId, bool answersRefs})> {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> hint = const Value.absent(),
            Value<String> topicId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionsCompanion(
            id: id,
            question: question,
            description: description,
            hint: hint,
            topicId: topicId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String question,
            required String description,
            required String hint,
            required String topicId,
            Value<int> rowid = const Value.absent(),
          }) =>
              QuestionsCompanion.insert(
            id: id,
            question: question,
            description: description,
            hint: hint,
            topicId: topicId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({topicId = false, answersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (answersRefs) db.answers],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (topicId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.topicId,
                    referencedTable:
                        $$QuestionsTableReferences._topicIdTable(db),
                    referencedColumn:
                        $$QuestionsTableReferences._topicIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (answersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$QuestionsTableReferences._answersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestionsTableReferences(db, table, p0)
                                .answersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.questionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuestionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuestionsTable,
    Question,
    $$QuestionsTableFilterComposer,
    $$QuestionsTableOrderingComposer,
    $$QuestionsTableAnnotationComposer,
    $$QuestionsTableCreateCompanionBuilder,
    $$QuestionsTableUpdateCompanionBuilder,
    (Question, $$QuestionsTableReferences),
    Question,
    PrefetchHooks Function({bool topicId, bool answersRefs})>;
typedef $$AnswersTableCreateCompanionBuilder = AnswersCompanion Function({
  required String id,
  required String answer,
  required bool isCorrect,
  required String questionId,
  Value<int> rowid,
});
typedef $$AnswersTableUpdateCompanionBuilder = AnswersCompanion Function({
  Value<String> id,
  Value<String> answer,
  Value<bool> isCorrect,
  Value<String> questionId,
  Value<int> rowid,
});

final class $$AnswersTableReferences
    extends BaseReferences<_$AppDatabase, $AnswersTable, Answer> {
  $$AnswersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestionsTable _questionIdTable(_$AppDatabase db) =>
      db.questions.createAlias(
          $_aliasNameGenerator(db.answers.questionId, db.questions.id));

  $$QuestionsTableProcessedTableManager get questionId {
    final manager = $$QuestionsTableTableManager($_db, $_db.questions)
        .filter((f) => f.id($_item.questionId));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AnswersTableFilterComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableFilterComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableOrderingComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnswersTable> {
  $$AnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questionId,
        referencedTable: $db.questions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestionsTableAnnotationComposer(
              $db: $db,
              $table: $db.questions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AnswersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool questionId})> {
  $$AnswersTableTableManager(_$AppDatabase db, $AnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<String> questionId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnswersCompanion(
            id: id,
            answer: answer,
            isCorrect: isCorrect,
            questionId: questionId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String answer,
            required bool isCorrect,
            required String questionId,
            Value<int> rowid = const Value.absent(),
          }) =>
              AnswersCompanion.insert(
            id: id,
            answer: answer,
            isCorrect: isCorrect,
            questionId: questionId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AnswersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({questionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (questionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questionId,
                    referencedTable:
                        $$AnswersTableReferences._questionIdTable(db),
                    referencedColumn:
                        $$AnswersTableReferences._questionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AnswersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnswersTable,
    Answer,
    $$AnswersTableFilterComposer,
    $$AnswersTableOrderingComposer,
    $$AnswersTableAnnotationComposer,
    $$AnswersTableCreateCompanionBuilder,
    $$AnswersTableUpdateCompanionBuilder,
    (Answer, $$AnswersTableReferences),
    Answer,
    PrefetchHooks Function({bool questionId})>;
typedef $$AnsweredQuestionsTableCreateCompanionBuilder
    = AnsweredQuestionsCompanion Function({
  required String questionId,
  required String question,
  required String answerId,
  required String answer,
  required bool isCorrect,
  required DateTime answeredAt,
  Value<int> rowid,
});
typedef $$AnsweredQuestionsTableUpdateCompanionBuilder
    = AnsweredQuestionsCompanion Function({
  Value<String> questionId,
  Value<String> question,
  Value<String> answerId,
  Value<String> answer,
  Value<bool> isCorrect,
  Value<DateTime> answeredAt,
  Value<int> rowid,
});

class $$AnsweredQuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $AnsweredQuestionsTable> {
  $$AnsweredQuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answerId => $composableBuilder(
      column: $table.answerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<DateTime, DateTime, DateTime> get answeredAt =>
      $composableBuilder(
          column: $table.answeredAt,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$AnsweredQuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $AnsweredQuestionsTable> {
  $$AnsweredQuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answerId => $composableBuilder(
      column: $table.answerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get answer => $composableBuilder(
      column: $table.answer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => ColumnOrderings(column));
}

class $$AnsweredQuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnsweredQuestionsTable> {
  $$AnsweredQuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get answerId =>
      $composableBuilder(column: $table.answerId, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumnWithTypeConverter<DateTime, DateTime> get answeredAt =>
      $composableBuilder(
          column: $table.answeredAt, builder: (column) => column);
}

class $$AnsweredQuestionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnsweredQuestionsTable,
    AnsweredQuestion,
    $$AnsweredQuestionsTableFilterComposer,
    $$AnsweredQuestionsTableOrderingComposer,
    $$AnsweredQuestionsTableAnnotationComposer,
    $$AnsweredQuestionsTableCreateCompanionBuilder,
    $$AnsweredQuestionsTableUpdateCompanionBuilder,
    (
      AnsweredQuestion,
      BaseReferences<_$AppDatabase, $AnsweredQuestionsTable, AnsweredQuestion>
    ),
    AnsweredQuestion,
    PrefetchHooks Function()> {
  $$AnsweredQuestionsTableTableManager(
      _$AppDatabase db, $AnsweredQuestionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnsweredQuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnsweredQuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnsweredQuestionsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> questionId = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> answerId = const Value.absent(),
            Value<String> answer = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<DateTime> answeredAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnsweredQuestionsCompanion(
            questionId: questionId,
            question: question,
            answerId: answerId,
            answer: answer,
            isCorrect: isCorrect,
            answeredAt: answeredAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String questionId,
            required String question,
            required String answerId,
            required String answer,
            required bool isCorrect,
            required DateTime answeredAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AnsweredQuestionsCompanion.insert(
            questionId: questionId,
            question: question,
            answerId: answerId,
            answer: answer,
            isCorrect: isCorrect,
            answeredAt: answeredAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AnsweredQuestionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnsweredQuestionsTable,
    AnsweredQuestion,
    $$AnsweredQuestionsTableFilterComposer,
    $$AnsweredQuestionsTableOrderingComposer,
    $$AnsweredQuestionsTableAnnotationComposer,
    $$AnsweredQuestionsTableCreateCompanionBuilder,
    $$AnsweredQuestionsTableUpdateCompanionBuilder,
    (
      AnsweredQuestion,
      BaseReferences<_$AppDatabase, $AnsweredQuestionsTable, AnsweredQuestion>
    ),
    AnsweredQuestion,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$AnswersTableTableManager get answers =>
      $$AnswersTableTableManager(_db, _db.answers);
  $$AnsweredQuestionsTableTableManager get answeredQuestions =>
      $$AnsweredQuestionsTableTableManager(_db, _db.answeredQuestions);
}
