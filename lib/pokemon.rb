class Pokemon
end
class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
        SQL
        pokerow = db.execute(sql, id)[0]
        self.new(id: pokerow[0], name: pokerow[1], type: pokerow[2], db: db)
    end
end
