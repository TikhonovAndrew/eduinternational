class BranchesController < ApplicationController
	def show
		@branches = Branch.all
		@events = Event.all
		@fairs = Fair.all
		@schools = School.all
		@countries = Country.all
		@posts = Post.all
    end
end
