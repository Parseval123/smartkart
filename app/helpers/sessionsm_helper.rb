module SessionsmHelper

def log_in_m(manager)
session[:manager_id] = manager.id
end

def current_manager
@current_manager ||= Manager.find_by(id: session[:manager_id])
end

def logged_in_m?
!current_manager.nil?
end

def log_out_m
session.delete(:manager_id)
@current_manager = nil
end

def current_manager?(manager)
manager == current_manager
end

end
