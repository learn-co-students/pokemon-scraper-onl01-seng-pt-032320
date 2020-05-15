require 'pry'

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id 

    def initialize(id = nil, name = nil, type = nil, db) 
        @id = id 
        @name = name
        @type = type
        @db = db
    end 


    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) 
            VALUES (?, ?)"
        db.execute(sql, [name, type]) 

        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 
        

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
        db.execute(sql, id).map do |row|
            self.new(id, row[1], row[2], db)
        end.first
    end 

end
