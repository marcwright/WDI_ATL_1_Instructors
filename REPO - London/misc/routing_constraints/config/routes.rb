Clayton::Application.routes.draw do

  get '/', to: 'welcome#index'
  get '/:slug', to: 'welcome#vacation', constraints: VacationConstraint

end
