class ApplicationController < ActionController::Base


	 layout :set_layout
 def set_layout
    if current_user
      'profil'
    else
      'application'
    end
 end

<<<<<<< HEAD
end
=======
end
>>>>>>> 2d702f8615040df50968f48526a3a4659395894f
