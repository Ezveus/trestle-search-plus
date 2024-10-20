module Trestle
  module Search
    module Resource
      extend ActiveSupport::Concern

      included do
        # Include custom #collection method on Resource instance
        prepend Collection

        # Include custom #collection method on Resource class
        singleton_class.send(:prepend, Collection)
      end

      module Collection
        def collection(params={})
          relation = searchable? ? search(params[:q].presence, params) || super : super

          if filterable?
            filter(relation, params)
          else
            relation
          end
        end

        def search(query, params={})
          adapter.search(query, params)
        end

        def filter(relation, params={})
          adapter.filter(relation, params)
        end
      end

      module ClassMethods
        def searchable?
          adapter.respond_to?(:search)
        end

        def filterable?
          adapter.respond_to?(:filter)
        end
      end
    end
  end
end
