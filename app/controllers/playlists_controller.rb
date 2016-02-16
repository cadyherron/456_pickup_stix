class PlaylistsController < ApplicationController

  before_action :require_login, except: [:show]






end
