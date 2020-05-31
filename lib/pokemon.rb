class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(name:, type:, id:, db:)
        @name = name
        @type = type 
        @id = id
    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type)  VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        pokemon = self.new(name: row[1],type: row[2],id: row[0],db: @db)
    end 
    
end
