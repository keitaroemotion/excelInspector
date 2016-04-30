#https://github.com/zdavatz/spreadsheet/blob/master/GUIDE.md

require 'spreadsheet'

class XlsReader

    def self.checkCell(row, kw)
        row.each do |cell|
            if cell.include? kw
                return row
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
        book = Spreadsheet.open file
        book.worksheets.each do |sheet|
            res = self::getSheet(sheet, kw, res)
        end
        return res
    end

    def self.displaySheets(res)
        res.each do |r|
            puts "#{r}".chomp
        end
    end

end
