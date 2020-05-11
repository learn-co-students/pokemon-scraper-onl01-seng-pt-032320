class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id = nil, name = nil, type = nil, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
    
    db.execute(sql, [name, type])
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * 
    FROM pokemon
    WHERE id = ?
    SQL

    new_pokemon = db.execute(sql, id).flatten
    Pokemon.new(id, new_pokemon[1], new_pokemon[2], db )
  end






end