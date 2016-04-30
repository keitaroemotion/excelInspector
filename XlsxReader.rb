#https://github.com/weshatheleopard/rubyXL

require 'rubyXL'
require 'colorize'

class XlsxReader

    def self.pop(row, i)
        begin
            return "#{row.cells[i].value}"  
        rescue
            return ""
        end
    end

    def self.checkCell(row, kw)
        row.cells.each do |cell|
				    if cell.value.include? kw
						    return [self::pop(row,0), self::pop(row,1), self::pop(row,2)]
            end 
        end
        return []
    end

    def self.getRow(row, kw)
        return self::checkCell row, kw
    end

    def self.getSheet(sheet, kw, res)
        sheet.each do |row|
            res = res.push(self::getRow(row, kw))
        end
        return res
    end

    def self.getSheets(file, kw, res=[])
        book = RubyXL::Parser.parse(file)
        book.worksheets.each do |sheet|
            res = self::getSheet(sheet, kw, res)
        end
        return res
    end

    def self.displaySheets(res)
        res.each do |r|
            puts "#{r}".chomp.green
        end
    end
end
