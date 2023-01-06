{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem
As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

┌────────────────────────────┐
│ Diary                      │
│                            │
│ - add(entries)             │
│ - view all                 │
│ - select by reading time   │
│ - view todo list           │
│ - view contact list        │
│                            │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Diary Entries (title,   │
│ contents, contacts)     │
│                         │
│ - title                 │
│ - contents              │
│ - contacts              │
└─────────────────────────┘

┌─────────────────────────┐
│ Todo                    │
│ - task                  │
│ - completed             │
└─────────────────────────┘
Also design the interface of each class in more detail.

class Diary
  def initialize
    # empty array for entries
    # empty array for todos
    # empty array for contacts
  end

  def add(entry) # entry is an instance of Diary_Entry
    # Entry gets added to the diary
    # Contacts are passed to contact list
    # Returns nothing
  end

  def add_chore(todo) #entry is an instance of ToDo
    #entry gets added to todo list

  def view_all
    # Returns a list of entry objects
  end
  
  def select_by_reading_time(wpm, minutes) # wpm and minutes are integers
    # Returns an entry based on the reading time calculated
  end

  def view_todo
    # returns a list of all tasks on the todo list what are not completed
  end

  def view_contacts
    # returns a list of all mobile numbers in diary entries
  end
end


class DiaryEntry
  def initialize(title, contents, contact) #all args are strings
    #...
    end
    def title
    # show entry title
    end
    def contents
    # show contents of entry
    end
    def contact
    # show contact details of entry
    end
end

class ToDo
    def initialize(task) # task is a string
    # sets done to false ss status
    end

    def task
    # returns task
    end

    def mark_done!
    # marks a todo as done
    end

    def done?
    # checks if task is done and returns answer
    end
end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# 1 - adds an entry to the diary list
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
diary.add(entry_1) 
diary.view_all => [entry_1]

# 2 - shows a list of all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_2 = DiaryEntry.new("2/1", "I was very sleepy")
diary.add(entry_1)
diary.add(entry_2)
diary.view_all => [entry_1, entry_2]

# 3 - selects content by reading time available
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
entry_2 = DiaryEntry.new("2/1", "I was very sleepy today, back to bed", "Dad - 07944112233")
entry_3 = DiaryEntry.new("3/1", "Today is the third day of the year", "Simone - 07903112233")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.select_by_reading_time(2, 2) => entry_1

# 4 - shows all incomplete tasks in a list
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
todo = Todo.new("buy milk")
diary.add(entry_1)
diary.add_chore(todo)
diary.view_todo) => [todo]

# 5 - returns a list of contacts
diary = Diary.new
entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
entry_2 = DiaryEntry.new("2/1", "I was very sleepy today, back to bed", "Dad - 07944112233")
entry_3 = DiaryEntry.new("3/1", "Today is the third day of the year", "Simone - 07903112233")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.view_contacts => ["Mum - 07903112233", "Dad - 07944112233", "Simone - 07903112233"]

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

TODO unit tests
# 1 - initailises with a task
todo = ToDo.new("buy milk")
todo => todo

# 2 - returns the task when asked
todo = ToDo.new("buy milk")
todo.task => "buy milk"

# 3 - marks the task as done
todo = Todo.new("Buy milk")
todo.mark_done! => true

# 4 - checks if a task is done
todo = Todo.new("Buy milk")
todo_2 = Todo.new("Buy bread")
todo.mark_done!
todo.done? => true
todo_2.done? => false

DIARY ENTRY unit tests
# 1 - it in initalises
diary_entry = DiaryEntry.new("1/1", "Hello", "Mum - 07904433112")
diary_entry => diary_entry

# 2 - returns output for each method called
diary_entry = DiaryEntry.new("1/1", "Today is the first of the year", "Simone - 07903112233")
diary_entry.title => "1/1"
diary_entry.contents => "Today is the first of the year"
diary_entry.contact => "Simone - 07903112233"
diary_entry.count_words => 7

DIARY unit tests
# 1 - has an empty list of entries
diary = Diary.new
diary.view_all => []

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.