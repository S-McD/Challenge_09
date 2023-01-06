class Diary
    def initialize
      @diary_entry = []
      @todos = []
      @contacts = []
    end
  
    def add(entry) 
        @diary_entry << entry
        @contacts << entry.contact
    end

    def add_chore(todo)
        @todos << todo
    end
  
    def view_all
      return @diary_entry
    end
    
    def select_by_reading_time(wpm, minutes) 
        reading_time = wpm * minutes
        match_list = @diary_entry.select { |entry| entry.count_words <= reading_time}
        return match_list[-1]
    end
  
    def view_todo
        pending_list = @todos.select { |todo| todo.done? == false }
        return pending_list
    end
  
    def view_contacts
      return @contacts
    end
end