class Bar 
attr_accessor :name, :id, :address, :price, :phone, :reviews

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

def self.happy_hour_reviews(bar)
    review_array = []
    bar.reviews.each do |review|
        if review["text"].include?("happy hour")
            review_array << review["text"]
        end
    end
    review_array
end

end