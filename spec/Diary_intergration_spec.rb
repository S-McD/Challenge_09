require "09_diary"
require "09_diary_entry"

RSpec.describe "Diary Intergration" do
    context "when we add a diary entry" do
        it "comes back in the list" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
            diary.add(entry_1)
            expect(diary.view_all).to eq [entry_1]
        end
        it "add additional entries to the same list" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
            entry_2 = DiaryEntry.new("2/1", "I was very sleepy", "Dad - 07944112233")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.view_all).to eq [entry_1, entry_2]
        end
        it "selects entries to read based on reading time" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
            entry_2 = DiaryEntry.new("2/1", "I was very sleepy today, back to bed", "Dad - 07944112233")
            entry_3 = DiaryEntry.new("3/1", "Today is the third day of the year", "Simone - 07903112233")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.add(entry_3)
            expect(diary.select_by_reading_time(2, 2)).to eq entry_1
        end
        it "returns a list of incomplete todos" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
            todo = Todo.new("buy milk")
            diary.add(entry_1)
            diary.add_chore(todo)
            expect(diary.view_todo).to eq [todo]
        end
        it "returns a list of contacts" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("1/1", "Today I woke up", "Mum - 07903112233")
            entry_2 = DiaryEntry.new("2/1", "I was very sleepy today, back to bed", "Dad - 07944112233")
            entry_3 = DiaryEntry.new("3/1", "Today is the third day of the year", "Simone - 07903112233")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.add(entry_3)
            expect(diary.view_contacts).to eq ["Mum - 07903112233", "Dad - 07944112233", "Simone - 07903112233"]
        end
    end
end