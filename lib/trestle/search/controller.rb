module Trestle
  module Search
    module Controller
      def index
        if admin.searchable?
          if params[:q].present? && params[:filters].blank?
            breadcrumb t("admin.search.results", default: "Search Results"), { q: params[:q] }
          elsif params[:q].blank? && params[:filters].present?
            breadcrumb t("admin.search.results", default: "Search Results"), { filters: params[:filters] }
          elsif params[:q].present? && params[:filters].present?
            breadcrumb t("admin.search.results", default: "Search Results"), { q: params[:q], filters: params[:filters] }
          end
        end

        super
      end
    end
  end
end
