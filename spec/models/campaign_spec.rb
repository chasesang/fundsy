require 'rails_helper'

RSpec.describe Campaign, type: :model do
  #whenever you want to start a new groupd of test xampels, you can use either `describe` or `context` they are functionalty the same but depending on the context, one maybe better than the other.

  describe 'Validations' do

    #whenever you want to define a test example you use `it` or `specity`. they are funcationlty the same. Make sure to give a good desrtiption about your test.

    it 'requires a title'  do
      # GIVEN: We have a new campaign Object
      c= Campaign.new
      #WHEN: we invoke Validations
      c.valid?

      #THEN: there is a validation error
      #when we want to test outcome in RSpec we always start with `expect` RSpect can use `mathing` which is more sophisticated than simple equality check

      # expect(c).to be_invalid
      expect(c.errors).to have_key(:title)
    end

    it 'requires a unique title' do
      # GIVEN: we have a new campaign Object and we have an existing campaign reccord in the database (with same title as the new one)

      Campaign.create ({title: 'abc', body: 'xyz', goal: 10, end_date: 60.days.from_now})

      c = Campaign.new({title: 'abc'})

      #WHEN: we invoke Validations
      c.valid?

      #THEN: expect c to have errors on the title field
      expect(c.errors). to have_key(:title)
    end

  end
end
