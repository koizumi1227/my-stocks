module ApplicationHelper
  include Pagy::Frontend

  def human(klass, attribute = nil)
    target = (klass.class == Class ? klass : klass.class)
    return target.model_name.human if attribute.blank?

    target.human_attribute_name(attribute)
  end

  def active_if(*names)
    if active_namespace?(*names) || active_controller?(*names) || active_action?(*names)
      "active"
    else
      "inactive"
    end
  end

  def active_controller?(*names)
    names.any? { |name| controller_path == name }
  end

  def active_namespace?(*namespaces)
    namespaces.any? { |namespace| controller_path.start_with?(namespace) }
  end

  def active_action?(*names)
    names.any? { |name| name == "#{controller_path}#{action_name}" }
  end

  def ga_event_tracker_hash(category, action, label, value = 0)
    { category: category, action: action, label: label, value: value }
  end

  def i18n_selector(model, property)
    model = model.to_s
    property = property.to_s
    eval("#{model}.#{property}.map {|key, value| [#{model}.#{property}_i18n[key], value]}", binding, __FILE__, __LINE__) # rubocop:disable Security/Eval
  end

  def boolean_selector
    [true, false].map { |val| [t(val), val] }
  end
end
