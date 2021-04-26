# frozen_string_literal: true

ActiveAdmin.register Film do
  permit_params :title, :description, :image, :director, :actors, :imdb_rating, :user_id, :published, :slug

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_film_path(film), method: :put unless film.published?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_film_path(film), method: :put if film.published?
  end

  member_action :publish, method: :put do
    film = Film.friendly.find(params[:id])
    film.update(published: true)
    redirect_to admin_film_path(film)
  end

  member_action :unpublish, method: :put do
    film = Film.friendly.find(params[:id])
    film.update(published: false)
    redirect_to admin_film_path(film)
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :director
    column :actors
    column :imdb_rating
    column :user_id
    column :created_at
    column :updated_at
    column :published
    actions
  end
end
