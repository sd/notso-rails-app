#==============================================================================
# ActiveRecord Chunky Find - by Sebastian Delmont <sd@notso.net>
#==============================================================================
# It's nice to have an easy way to iterate over model objects without having 
# to load them all in memory at once.

class ActiveRecord::Base
  def self.chunky_find(args = {}, &block)
    reporter = args.delete(:reporter)
    reporter = nil unless reporter and reporter.respond_to? :call

    sleep_duration = args[:sleep]
    args.delete(:sleep)

    args = args.dup

    conditions = args[:conditions] || ["1"]
    conditions = [conditions] if conditions.kind_of? String

    raise "Chunky Find does not support :order in the conditions" if args[:order]
    args[:order] = "#{table_name}.#{connection.quote_column_name(primary_key)} ASC"
    
    last_id = nil

    count = 0
    total = 0
    total = self.count(args) if reporter


    args[:limit] ||= 100

    while items = self.find(:all, args) and not items.empty?
      items.each do |item|
        last_id = item.id
        count += 1
        block.call item
      end

      if sleep_duration
        puts "sleeping for #{sleep_duration} seconds...\n\n"
        sleep(sleep_duration)
      end

      reporter and reporter.call(count, total)
      args[:conditions] = [conditions[0] + " AND #{table_name}.#{connection.quote_column_name(primary_key)} > #{last_id}", conditions[1]]
    end

  end

  def self.iterate(args = {}, &block)
    args.merge! :reporter => Proc.new {|current, total| puts "#{sprintf("%2.2f", 100 * current.to_f / total)}%: #{current}\n"}
    self.chunky_find(args, &block)
  end
end



