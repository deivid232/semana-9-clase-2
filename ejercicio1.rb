# frozen_string_literal: true

require 'byebug'
class Table
  attr_reader :name, :incomes
  def initialize(name, *incomes)
    @name = name
    @incomes = incomes.map(&:to_i)
  end

  def self.build(file)
    tables = []
    File.readlines(file).each do |line|
      table_info_array = line.chomp.split(', ')
      name = table_info_array.shift
      incomes = table_info_array
      tables << Table.new(name, *incomes)
    end
    tables
  end

  def self.max_profit(file)
    tables = build(file)
    best_result = {}
    tables.each do |table, _day|
      best_result[table.name] = [table.max, table.max_day]
    end

    best_result
  end

  def self.avg_profit(file)
    tables = build(file)
    tables.each do |ganancias|
      a = ganancias.incomes # ganacias por mesa y dia
      b = a.sum # ganacias totales
      c = ganancias.incomes.length # cantidad de dias
      promedio = b / c # ganacias totales dividido por cantidad dias
      # print ganancias.name
      # print promedio
      puts "#{ganancias.name} promedio ganacias de: #{promedio} en un total de: #{c} dias "
    end
  end

  def max
    incomes.max
  end

  def max_day
    incomes.index(max) + 1
  end
end

print Table.build('casino.txt')
puts Table.max_profit('casino.txt')
Table.avg_profit('casino.txt')
