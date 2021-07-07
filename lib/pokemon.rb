class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name: , type: , hp: nil , db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.find(id_num, db)
    poke_data= db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: poke_data[0], name: poke_data[1], type: poke_data[2], hp: poke_data[3], db: db)
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name, type)
  end


  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
