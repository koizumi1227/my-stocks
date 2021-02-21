module SearchConcern
  extend ActiveSupport::Concern

  def run_search(model_or_relation, *associations)
    original_model_name = model_or_relation.try(:klass) || model_or_relation
    query = associations.present? ? model_or_relation.includes(associations) : original_model_name

    @q = query.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    pluralized_model_name = original_model_name.to_s.underscore.pluralize
    objects = @q.result(distinct: true)

    instance_variable_set("@#{pluralized_model_name}_size", objects.size)
    pagy, paged_objects = pagy(objects)
    instance_variable_set("@pagy", pagy)
    instance_variable_set("@#{pluralized_model_name}", paged_objects.decorator_class? ? paged_objects.decorate : paged_objects)
  end
end
