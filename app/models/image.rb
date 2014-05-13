class Image < ActiveRecord::Base
  belongs_to :task

  has_attached_file :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: :default_avatar

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  private

  def default_avatar
    "/task_default_:style.png"
  end
end
