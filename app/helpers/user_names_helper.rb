module UserNamesHelper
  # Extract the first name of the current user from the ACM email address. 
  def extract_name
    current_user.email.rpartition('_').first.titleize
  end
end