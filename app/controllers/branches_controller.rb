class BranchesController < ApplicationController
	def show
		@branches = Branch.all
		@events = Event.all
		@fairs = Fair.all
		@schools = School.all
		@countries = Country.all
		@posts = Post.all
		@team_members = TeamMember.all
		@testimonials = Testimonial.all
    end
end
