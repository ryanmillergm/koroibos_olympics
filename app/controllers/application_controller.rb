class ApplicationController < ActionController::Base
    def four_oh_four
    render file: 'public/404', status: 404
  end
end
