# frozen_string_literal: true

# Since https://github.com/solidusio/solidus/pull/3524 was merged,
# we need to verify if we're using the single "Name" field or the
# previous first/last name combination.
module SolidusAddressNameHelper
  def fill_in_name
    if SolidusSupport.combined_first_and_last_name_in_address?
      fill_in 'Name', with: 'Bender Rodriguez'
    else
      fill_in 'First Name', with: 'Bender'
      fill_in 'Last Name', with: 'Rodriguez'
    end
  end
end
