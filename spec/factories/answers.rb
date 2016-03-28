FactoryGirl.define do
  factory :answer do
    body "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam"
  end

  factory :invalid_answer, class: "Answer" do
  	body nil
  end
end
