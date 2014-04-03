require "cal_exporter/version"
require "icalendar"
require "open-uri"
require "thor"
require "date"
require "thor"
require 'yaml'
# For Debug 
# TODO Delete it before publishing
require 'pry'
require 'awesome_print'

module CalExporter
  class CLI < Thor
    
    desc "calender CALENDER_ID FORMAT SAVE_LOCATION", "Export calender with specified file format"
    def calender(calendar_id, format, save_location)
      import = Importer.new(calendar_id)
      calendars = import.fetch
      export = Exporter.new(format, save_location)

      # save
      calendars.each do |calendar|
        calendar.events.each do |event|  
          export.save(event)
        end
      end
    end
  end

  require 'cal_exporter/exporter.rb'
  require 'cal_exporter/importer.rb'
  

end



