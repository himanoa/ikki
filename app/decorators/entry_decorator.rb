class EntryDecorator < Draper::Decorator
  delegate_all

  FORMAT = '%Y/%m/%d %H:%M:%S'

  def format_updated_at
    model.created_at.strftime(FORMAT)
  end

  def format_created_at
    model.created_at.strftime(FORMAT)
  end
end
