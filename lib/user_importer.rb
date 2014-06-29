class DataImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/user_data.csv")
    @filename = filename
  end

  def import
    field_names = ['username', 'password', 'img', 'age', 'gender', 'bio']

    print "Importing users from #{@filename}: "
    User.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        user = User.create!(attribute_hash)
        print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end