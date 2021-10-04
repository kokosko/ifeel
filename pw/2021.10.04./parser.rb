# frozen_string_literal: true


class ParseResponse
  attr_accessor :list

  def initialize
    @list = []
  end

  def search
    @list.select { |c| /\ \S*\ \S*\ S*/.match?(c['City']) }
  end
end


class CSVParser
  require 'faraday'
  require 'csv'

  def parse_from(url)

    response = Faraday.get(url)
    File.write('cities.csv', response.body)

    data = ParseResponse.new()

    CSV.foreach('./cities.csv', headers: true) do |row|
      data.list.push(row.to_h)
    end
    data
  end
end

