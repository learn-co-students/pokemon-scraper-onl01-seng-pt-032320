class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(hash)
        @name = hash[:name]
        @type = hash[:type]
        @database = hash[:db]
        @id = hash[:id]
    end

    def self.save(name, type, db)
          sql = <<-SQL
            INSERT INTO pokemon (name, type)
              VALUES (?, ?)
              SQL
          new_pokemon = db.execute(sql, name, type)
          @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

    end

    def self.find(id, db)
        sql  = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id).first << db
        keys = [:id, :name, :type, :db]
        hash = keys.zip(result).to_h
        found = self.new(hash)
    end
    
end
