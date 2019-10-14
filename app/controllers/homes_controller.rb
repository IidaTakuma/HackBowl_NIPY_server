# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  skip_before_action :require_profile, only: %i[index]
  def index; end
end
