

class Util 
    def self.displaySheets(res)
        res.each do |r|
            puts "#{r}".chomp.green
        end
    end
end
