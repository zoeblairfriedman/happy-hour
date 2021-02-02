class Bar 
attr_accessor :name, :address, :url, :phone, :price

@@all = []

def initialize(bar_hash)
    bar_hash.each do |key, value|
        self.send("#{key}=", value)
    end
    @@all << self
end

def self.all
    @@all
end


end