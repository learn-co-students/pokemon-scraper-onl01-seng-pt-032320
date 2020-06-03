class Pokemon
  attr_accessor :id, :name, :type, :db
  require "pry"
  def initialize (hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, database_connection)
    found_pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: database_connection)
  end

end
