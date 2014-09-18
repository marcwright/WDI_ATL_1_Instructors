require_relative '../lib/fortune'

describe FortuneCookie do
let( :fortune_cookie ){ FortuneCookie.new }
  describe "::new" do
    it "starts wrapped" do
      expect( fortune_cookie.wrapped? ).to be_truthy
    end
  end

  describe "#unwrap!" do
    it "unwraps fortune cookie" do
      fortune_cookie.unwrap!
      expect( fortune_cookie.wrapped? ).to be_falsey
    end
  end

  describe "#crack!" do
    it "Cracks cookie open if unwrapped" do
      fortune_cookie.unwrap!
      fortune_cookie.crack!
      expect( fortune_cookie.cracked? ).to be_truthy
    end

    it "does not crack if the cookie is still wrapped." do
      fortune_cookie.crack!
      expect(fortune_cookie.cracked? ).to be_falsey
    end
  end



  describe "#read" do
    it "tells you to unwrap it if it is still wrapped" do
      expect( fortune_cookie.read ).to eq("Unwrap me!")
    end
    ############################################################
    context "When the fortune cookie is unwrapped" do
      before { fortune_cookie.unwrap! }

    it "tells you to crack it if it's uncracked?" do
      #fortune_cookie.unwrap!
      expect( fortune_cookie.read ).to eq("Crack me!")
    end

    it "reads you a fortune if unwrapped and cracked" do
    #fortune_cookie.unwrap!
    fortune_cookie.crack!
    expect( fortune_cookie.read ).to eq("You will be really good at testing!")
    end
    end
    #########################################################
  end
end


