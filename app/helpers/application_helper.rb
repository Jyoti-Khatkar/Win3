module ApplicationHelper
    def likes(id=nil)
       if id.present?
           likes=Like.where(post_id: id,is_like: true).count
        end


    end
    def comment(id=nil)
        if id.present?
            comnt=Comment.where(post_id: id).count
         end
 
 
     end
end
