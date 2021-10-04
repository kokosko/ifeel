class Bucket
  PRICE = { 'bread' => 15, 'cheese' => 25, 'beer' => 50, 'watermelon' => 40 }.freeze
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(name)
    return puts "No #{name} in store" unless PRICE.key?(name)

    @items << name
    puts "Item #{name} added"
  end

  def +(bucket)
    @items.concat(bucket.items)
    bucket.clear
    puts "Buckets merged"
    self
  end

  def show
    puts "Your bucket: #{@items.any? ? @items.join(', ') : 'empty'}"
  end
  
  def clear
    @items.clear
  end

  def total_sum
    sum = 0
    @items.each { |item| sum += PRICE[item] }
    puts "Total sum #{sum} for #{@items.count} items"
  end
end

b1 = Bucket.new
b2 = Bucket.new
b1.add_item('milk')
b1.add_item('bread')
b1.add_item('bread')
b1.add_item('beer')
b2.add_item('watermelon')
b2.add_item('cheese')
b1.show
b2.show
b1+b2
b1.show
b2.show
b1.total_sum
b2.total_sum