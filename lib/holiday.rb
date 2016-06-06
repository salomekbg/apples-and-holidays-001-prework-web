require 'pry'
=begin
holiday_hash =
 {
   :winter => {
     :christmas => ["Lights", "Wreath"],
     :new_years => ["Party Hats"]
   },
   :summer => {
     :fourth_of_july => ["Fireworks", "BBQ"]
   },
   :fall => {
     :thanksgiving => ["Turkey"]
   },
   :spring => {
     :memorial_day => ["BBQ"]
   }
 }
=end

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday_name, supply_array|
    supply_array << supply
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
    puts "#{season.to_s.capitalize}:"
    data.each do |holiday_name, supply_array|
      puts "  #{holiday_name.to_s.split('_').map(&:capitalize).join(' ')}: #{supply_array.join(', ')}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  new_array = []

  holiday_hash.each do |season, data|
    data.each do |holiday_name, supply_array|
      if supply_array.include?("BBQ")
        new_array << holiday_name
      end
    end
  end
  new_array
end

=begin
def all_holidays_with_bbq(supplies_hash)
  supplies_hash.map do |season, holidays|
    holidays.map do |holiday, supplies|
      holiday if supplies.include?("BBQ")
    end
  end.flatten.compact
end
=end
