# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ModuloExtension < Radiant::Extension
  version "1.0"
  description "Adds tags for odd and even children, as well as other modulo operations"
  url "http://github.com/lonnon/modulo"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :modulo
  #   end
  # end
  
  def activate
    Page.send :include, Modulo
  end
  
  def deactivate
    # admin.tabs.remove "Modulo"
  end
  
end
