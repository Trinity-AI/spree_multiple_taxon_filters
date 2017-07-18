module Spree
  BaseHelper.class_eval do
    alias_method :original_seo_url, :seo_url  unless method_defined?(:original_seo_url)

    def seo_url(taxon)
      root_taxon_permalink = taxon.root.permalink
      taxons = (taxons_without( root_taxon_permalink ) + [taxon]).uniq
      return expanded_seo_url( taxons )
    end
  end
end
