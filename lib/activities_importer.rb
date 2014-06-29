class ActivitiesImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/activities_data.csv")
    @filename = filename
  end

  def import
    field_names = ['description', 'location', 'img', 'actvities_type_id']

    print "Importing users from #{@filename}: "
    Activity.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        activity = Activity.create!(attribute_hash)
        print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end