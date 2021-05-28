module ApplicationHelper
  NOTICE_KEYS = {
    alert: "alert alert-danger", notice: "alert alert-info", success: "alert alert-success",
    warning: "alert alert-warning", primary: "alert alert-primary"
  }

  def message_class(key)
    NOTICE_KEYS[key.to_sym] + " text-center"
  end

  def heart_icon_class(aide)
    starred_aide = StarredAide.find_by(client_id: current_client.id, aide_id: aide.id)
    starred_aide == nil ? "far fa-star" : "fa fa-star"
  end
end
