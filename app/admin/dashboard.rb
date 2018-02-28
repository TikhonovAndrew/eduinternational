ActiveAdmin.register_page "Dashboard" do
  menu priority: 1
  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Events" do
          table_for Event.order("event_date_time desc").limit(10) do
            column("Name") { |order| link_to(order.name, admin_event_confirmations_path)}
            column("Start date")  { |order| (order.event_date_time) }
            column("Landing Page") { |order| link_to(order.name, event_path(order.name))}
          end
        end
      end
            column do
        panel "Recent Posts" do
          table_for Post.where("created_at").limit(10).each do |post|
            column("Landing Page") { |order| link_to(order.name, post_path(order.name))}
            column(:created_at) { |order| link_to(order.created_at, admin_post_path(order.name))}
          end
        end
      end

      
    end # columns

    columns do
      column do
        panel "Team Members" do
          table_for TeamMember.where("current_sign_in_at").limit(10).each do |teammember|
            column("Name"){ |order| link_to(order.name, team_members_path)}
            column("Position"){ |order| link_to(order.position, team_members_path(order.name))}
            column(:email)
            column(:phone)
          end
        end
      end




    # Define your dashboard sections here. Each block will be
    # rendered on the dashboard in the context of the view. So just
    # return the content which you would like to display.

    # The dashboard is organized in rows and columns, where each row
    # divides the space for its child columns equally.

    # To start a new row, open a new 'columns' block, and to start a
    # new column, open a new 'colum' block. That way, you can exactly
    # define the position for each content div.

    # == Simple Dashboard Column
    # Here is an example of a simple dashboard column
    #
    #   column do
    #     panel "Recent Posts" do
    #       content_tag :ul do
    #         Post.recent(5).collect do |post|
    #           content_tag(:li, link_to(post.title, admin_post_path(post)))
    #         end.join.html_safe
    #       end
    #     end
    #   end

    # == Render Partials
    # The block is rendererd within the context of the view, so you can
    # easily render a partial rather than build content in ruby.
    #
    #   column do
    #     panel "Recent Posts" do
    #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
    #     end
    #   end
  end # content
end

end


