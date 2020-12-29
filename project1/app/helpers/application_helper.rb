module ApplicationHelper

    def status_buttons  role, i
        return ["pending"] if role != "admin" && i.status == "draft"
        return [] if role != "admin" && i.status == "pending"
        return [] if role != "admin" && i.status == "public"
        a = ["public", "pending", "draft"]
        a.delete(i.status)
        a
    end
end
