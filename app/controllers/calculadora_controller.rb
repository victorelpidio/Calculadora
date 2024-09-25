class CalculadoraController < ApplicationController
    def index; end

    def calculate
      @num1 = params[:num1].to_i
      @num2 = params[:num2].to_i
      @operation = params[:operation]

      @result = case @operation
                when 'add'
                  @num1 + @num2
                when 'subtract'
                  @num1 - @num2
                when 'multiply'
                  @num1 * @num2
                when 'divide'
                  @num2 != 0 ? @num1 / @num2 : 'Divisão por zero'
                else
                  'Operação inválida'
                end
      render :index
    end
end
