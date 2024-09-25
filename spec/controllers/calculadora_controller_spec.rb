require 'rails_helper'

RSpec.describe CalculadoraController, type: :controller do
  describe "POST #calculate" do
    context "with valid operations" do
      it "returns the sum of two numbers" do
        post :calculate, params: { num1: 5, num2: 3, operation: 'add' }
        expect(assigns(:result)).to eq(8)
      end

      it "returns the subtraction of two numbers" do
        post :calculate, params: { num1: 10, num2: 4, operation: 'subtract' }
        expect(assigns(:result)).to eq(6)
      end

      it "returns the multiplication of two numbers" do
        post :calculate, params: { num1: 6, num2: 7, operation: 'multiply' }
        expect(assigns(:result)).to eq(42)
      end

      it "returns the division of two numbers" do
        post :calculate, params: { num1: 10, num2: 2, operation: 'divide' }
        expect(assigns(:result)).to eq(5)
      end
    end

    context "when dividing by zero" do
      it "returns an error message" do
        post :calculate, params: { num1: 10, num2: 0, operation: 'divide' }
        expect(assigns(:result)).to eq('Divisão por zero')
      end
    end

    context "with invalid operation" do
      it "returns an invalid operation message" do
        post :calculate, params: { num1: 10, num2: 2, operation: 'invalid_operation' }
        expect(assigns(:result)).to eq('Operação inválida')
      end
    end
  end
end
