# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title: t("#{controller_path.tr('/', '.')}.#{action_name}.title", default: nil),
      site: t('meta.site.name'),
      separator: t('meta.site.separator', default: '-'),
      canonical: canonical_href,
      viewport:  'initial-scale=1',
      keywords: 'ひまのあ 遺言書',
      reverse: true,
      og: {
        title: :title,
        type: 'blog',
        url: request.original_url,
        site_name: t('meta.site.name'),
        image: 'https://pbs.twimg.com/profile_images/899998496299769857/UqOjC9jI_400x400.jpg',
        description: :description,
        locale: 'ja_JP'
      }

    }
  end
end
