require 'delegate'

User = Struct.new(:first_name, :last_name)

class UserDecorator < SimpleDelegator
    def full_name
        "#{:first_name} #{:last_name}"
    end
end

decorator_user = UserDecorator.new(User.new("John", "Doe"))
pp decorator_user.full_name
pp decorator_user.first_name
pp decorator_user.last_name