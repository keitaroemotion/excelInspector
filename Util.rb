

class Util 
    def self.rmNilList(lis)
       newlis = []
       lis.each do |l|
           if l.size > 0
               newlis.push l
           end
       end
       return newlis
    end

    def self.displaySheets(res, color="green")
        rmNilList(res).each do |r|
            case color
            when "green"
                puts "  #{r}".chomp.green
            when "red"
                puts "  #{r}".chomp.red
            end
        end
    end
    def self.displayLine(file, k)
        (1..file.size).each do |x|
            print k
        end 
        puts
    end 
 
    def self.checkRes(res, i=0)
        res.each do |l|
            if l.size > 0
                i = i+1 
            end
        end
        return i > 0
    end
 
    def self.displayFile(res, file)
        if checkRes(res) 
            displayLine(file, " ")
            puts "#{file}        "
        end
        return file
    end
end
