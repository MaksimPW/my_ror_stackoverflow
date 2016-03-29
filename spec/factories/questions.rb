FactoryGirl.define do
  factory :question do
    title "Good title for Question"
    body "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam"
  end

  factory :invalid_question, class: "Question" do
  	title nil
  	body nil
  end
end