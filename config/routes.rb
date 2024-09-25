Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'calculadora#index' # A página inicial será a nossa calculadora
  post 'calculate', to: 'calculadora#calculate' # Rota para realizar o cálculo
end
