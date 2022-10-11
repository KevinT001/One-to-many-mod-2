require 'rails_helper'

RSpec.describe Fish, type: :model do 
  
  it { should belong_to :lake}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:avg_length)}
  it { should allow_value(true).for(:catch_and_release_only)}
  it { should allow_value(false).for(:catch_and_release_only)}
  
end