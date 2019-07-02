class ApplicationController < ActionController::Base

  def is_integer? string_to_check
    if !/\A\d+\z/.match(string_to_check)
      false
    else
      true
    end
  end

end
