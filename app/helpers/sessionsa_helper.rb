module SessionsaHelper

def log_in_a(admin)
session[:admin_id] = admin.id
end

def current_admin
@current_admin ||= Admin.find_by(id: session[:admin_id])
end

def logged_in_a?
!current_admin.nil?
end

def log_out_a
session.delete(:admin_id)
@current_admin = nil
end

def current_admin?(admin)
admin == current_admin
end


end
