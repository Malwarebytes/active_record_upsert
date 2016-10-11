Dir.glob(File.join(__dir__, 'active_record/**/*.rb')) do |f|
  require f
end

module ActiveRecord
  RecordSavedError = Class.new(ActiveRecordError)
end

::ActiveRecord::Base.prepend(ActiveRecordUpsert::ActiveRecord::PersistenceExtensions)
::ActiveRecord::Base.extend(ActiveRecordUpsert::ActiveRecord::PersistenceExtensions::ClassMethods)
::ActiveRecord::Base.prepend(ActiveRecordUpsert::ActiveRecord::TimestampExtensions)
::ActiveRecord::Base.prepend(ActiveRecordUpsert::ActiveRecord::TransactionsExtensions)

#::ActiveRecord::ConnectionAdapters::DatabaseStatements.include(ActiveRecordUpsert::ActiveRecord::ConnectionAdapters::Abstract::DatabaseStatementsExtensions)
::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include(ActiveRecordUpsert::ActiveRecord::ConnectionAdapters::Abstract::DatabaseStatementsExtensions)
::ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.include(ActiveRecordUpsert::ActiveRecord::ConnectionAdapters::Postgresql::DatabaseStatementsExtensions)

::ActiveRecord::Relation.include(ActiveRecordUpsert::ActiveRecord::RelationExtensions)
