require "spec_helper"
require_relative "../lib/sku"

describe Sku do
  subject ( :sku ) { Sku.new( "1", "Coke", 1.50, 2 ) }

  describe "::new" do
    it "sets the provided product code" do
      expect( sku.code ).to eq( "1" )
    end

    it "sets the provided product name" do
      expect( sku.product ).to eq( "Coke" )
    end

    it "sets the provided price" do
      expect( sku.price ).to eq( 1.50 )
    end

    it "sets the provided quantity" do
      expect( sku.quantity ).to eq( 2 )
    end
  end # - end of describe "::new"

  describe "#purchase" do
    it "decreases the available quantity by 1" do
      sku.purchase
      expect( sku.quantity ).to eq( 1 )
    end

    context "when there is no quantity" do
      before { sku.quantity.times { sku.purchase }}

      it "the quantity remains zero" do
        sku.purchase
        expect( sku.quantity ).to eq( 0 )
      end
    end
  end # - end of describe "#purchase"
end
