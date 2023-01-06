require "09_diary"

RSpec.describe Diary do
    context "initally" do
        it "has an empty list of entries" do
            diary = Diary.new
            expect(diary.view_all).to eq []
        end
    end
end
