require 'rails_helper'

RSpec.describe Course, type: :model do

  it "does save a valid course" do
    course = get_course
    expect(course).to be_valid
  end

  it "does not allow an empty name" do
    course = get_course
    course.name =  " "
    expect(course).to_not be_valid
  end

  it "does not allow oversized names" do
    course = get_course
    course.name =  'a'*51
    expect(course).to_not be_valid
  end

  it "does not allow oversized descriptions" do
    course.description = 'a'*1001
    expect(course).to_not be_valid
  end

end
