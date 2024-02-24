class AttendancesController < ApplicationController
  def index
    @students = Student.all
  end
end
