module BlogsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    elsif action_name == 'confirm' #モデル名がコントローラ名と異なるため　confirm画面時
      blogs_path                   #POST /blogs(.:format)  blogs#create
    elsif action_name == 'update' #モデル名がコントローラ名と異なるため update失敗時
      blog_path                    # PATCH  /blogs/:id(.:format)  blogs#update
    end
  end
end
