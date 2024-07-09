class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]

end
