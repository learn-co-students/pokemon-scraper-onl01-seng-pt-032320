class Pokemon
    attr_accessor :name, :type, :id
    attr_reader :db

    def initialize (name:, type:, id: nil, db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        sql_command = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?,?);
        SQL
        #pokemon = Pokemon.new(name: name,type: type,db: db)
        db.execute(sql_command,name,type)
        #pokemon.id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]  
    end

    def self.find(id,db)
        sql_query = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL
        result = db.execute(sql_query, id).flatten
        insert_from_table(result)
        
    end

    def self.insert_from_table(row)
        id,name,type = row
        pokemon = self.new(id: id, name: name, type: type, db: @db)
        pokemon
    end
end
