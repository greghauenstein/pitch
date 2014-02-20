ActiveAdmin.register Story do
  index do
    column "Story Title", :title
    column "Written by", :user, :sortable
    column "Submitted on", :created_at
    column "Last updated", :updated_at
    default_actions
  end 
end
