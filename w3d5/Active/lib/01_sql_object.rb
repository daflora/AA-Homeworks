require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @column if @column
    result=DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    @column=result.flatten.map{|col| col.to_sym}
  end

  def self.finalize!

    self.columns.each do |attribute|
      define_method("#{attribute}") do
        attributes[attribute]
      end
      define_method("#{attribute}=") do |value|
        attributes[attribute] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
    # @table_name = self.to_s.concat("s")

  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all

    result=DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL
    parse_all(result)
  end

  def self.parse_all(results)
    answer = []

    answer = results.map {|v| self.new(v)}
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        id = ?
      LIMIT
        1
    SQL
    result
  end

  def initialize(params = {})
    answer = {}
  #  answer = params.map {|key,value| key.to_sym}
    params.each do |key,value|
      k=key.to_sym
      if self.class.columns.include?(k)
        self.send("#{k}=", value)
      else
        raise "unknown attribute '#{key}'"
      end
    end
    self

  end

  def attributes
    @attributes ||= {}



  end

  def attribute_values
    result = []
    self.class.columns.each do |column|
      result << @attributes[column]
    end
    result
    # end
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
