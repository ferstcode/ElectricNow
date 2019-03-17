ActiveAdmin.register_page "Dashboard" do
  
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  
  content title: proc{ I18n.t("active_admin.dashboard") } do
    
    div do
      render 'graph', average: average
    end
    
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    # column do
    # panel "Recent Posts" do
    # ul do
    # Post.recent(5).map do |post|
    # li link_to(post.title, admin_post_path(post))
    # end
    # end
    # end
    # end
    
    # column do
    # panel "Info" do
    # para "Welcome to ActiveAdmin."
    # end
    # end
    # end
  end
end

def average
  @result=[]
  User.where(role: :electric).each do |electric|
    sum = 0
    electric.electric_qualifications.each do |q|
      sum += q.calification
    end
    inner = []
    count = electric.electric_qualifications.count
    prom = sum/((count > 0) ? count : 1)
    inner += [electric.name.to_s, prom]
    @result.push(inner)
  end
  @result.sort_by { |ed| ed.last }.reverse!.first(10)
end