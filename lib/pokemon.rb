class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
        ##@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]
        Pokemon.new(id: id, name: new_pokemon[1], type: new_pokemon[2], db:db)
    end





end
