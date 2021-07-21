module Errors
  class UserNotFoundError < StandardError
    def message
      'This user does not exist'
    end
  end
end
