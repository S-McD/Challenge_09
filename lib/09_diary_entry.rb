class DiaryEntry
    def initialize(title, contents, contact)
      @title = title
      @contents = contents
      @contact = contact
    end

    def title
      return @title
    end

    def contents
      return @contents
    end
    
    def contact
      return @contact
    end

    def count_words
      return @contents.split(" ").length
    end
end