class BookmarksController < ApplicationController

  before_action :require_login, only: [:add, :remove]




end
