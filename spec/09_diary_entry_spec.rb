require "09_diary_entry"

RSpec.describe DiaryEntry do
    it "initalises" do
        diary_entry = DiaryEntry.new("1/1", "Hello", "Mum - 07904433112")
        expect(diary_entry).to eq diary_entry
    end
    it "returns output for method called" do
        diary_entry = DiaryEntry.new("1/1", "Today is the first of the year", "Simone - 07903112233")
        expect(diary_entry.title).to eq "1/1"
        expect(diary_entry.contents).to eq "Today is the first of the year"
        expect(diary_entry.contact).to eq "Simone - 07903112233"
        expect(diary_entry.count_words).to eq 7
    end
end