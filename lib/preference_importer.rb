class PreferenceImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/preference_data.csv")
    @filename = filename
  end

  def import
    field_names = ['user_id', 'gender_pref', 'min_age', 'max_age', 'activity_type_id']

    print "Importing users from #{@filename}: "
    Preference.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        preference = Preference.create!(attribute_hash)
        print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end