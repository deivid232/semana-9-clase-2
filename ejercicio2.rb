# frozen_string_literal: true

# Crear una clase Course cuyo constructor reciba el nombre del curso y las fechas de inicio y término.
#
# Crear un método que permita leer el archivo y crear una instancia de la clase Course por línea del archivo.
#
# Crear métodos que permitan:
#
# Saber qué cursos comienzan previo a una fecha entregada como argumento.
#
# Saber qué cursos finalizan posterior a una fecha entregada como argumento.
#
# En ambos el métodos argumento por defecto debe ser la fecha de hoy.
#
# Ambos métodos deben levantar una excepción si la fecha recibida es >= 2018-01-01.
require 'date'

class Curso
  attr_reader :curso, :inicio, :termino
  def initialize(curso, *fecha)
    @curso = curso
    @fecha = fecha.map { |date| Date.parse(date) }
  end

  def self.leer_archivo(file)
    tables = []
    File.readlines(file).each do |line|
      table_info_array = line.chomp.split(', ')
      curso = table_info_array.shift
      fecha = table_info_array
      tables << Curso.new(curso, *fecha)
    end
    tables
  end

  def self.comienzo_previo_fecha(file)
    # fecha.select { |date| date < Date.today }

    tables = leer_archivo(file)
    tables.each do |leer_fecha|
      a = leer_fecha.fecha # ganacias por mesa y dia
      puts "#{leer_fecha.a}  "
    end
  end

  def self.finaliza_posterior_fecha;
  end
end

print Curso.leer_archivo('curso.txt')
#print Curso.comienzo_previo_fecha('curso.txt')
