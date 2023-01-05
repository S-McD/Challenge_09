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
  end

  def add(entry) # entry is an instance of Diary_Entry
    # Entry gets added to the diary
    # Returns nothing
  end

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
    def initialize
    #...
    end
    def add_task(chore)
    # Adds a chore to a list
    end
    def mark_complete
    # marks a todo as complete
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
entry_1 = DiaryEntry.new("1/1", "Today I woke up")
entry_2 = DiaryEntry.new("2/1", "I was very sleepy today")
diary.add(entry_1)
diary.add(entry_2)
diary.select_by_reading_time(2, 2) => "Today I woke up"

# 4 - shows all tasks in a list
diary = Diary.new
todo = ToDo.new


4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.