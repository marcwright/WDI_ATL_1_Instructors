require_relative '../lib/student'

describe Student do
  let (:student) { Student.new("Richard", 100, 0) }
  describe "::new" do

    it "can be instantiate with a name, 100% energy, and 0 knowledge" do
      expect( student.name ).to eq('Richard')
      expect( student.energy ).to eq(100)
      expect( student.knowledge).to eq(0)
    end
  end

  describe "#code" do

    it "will increase knowledge but decrease energy" do
      student.code
      expect( student.energy ).to eq(95)
      expect( student.knowledge ).to eq(3)
    end

    it "will not decrease energy or increase knowledge if enery is at 0" do
      student = Student.new("Richard", 0, 0)
      student.code
      expect( student.energy ).to eq(0)
    end

    it "will not increase knowledge if you're tired, ie, energy less than 30" do
        student = Student.new("Richard", 25, 0)
        student.code
        expect( student.energy ).to eq(20)
        expect( student.knowledge ).to eq(0)
    end
  end

  describe "#break" do

    it "will increase energy" do
      student = Student.new("Richard", 35, 0)
      student.break
      expect( student.energy ).to eq(40)
    end

    it "will not allow energy to go above 100" do
      student = Student.new("Richard", 98, 0)
      student.break
      expect( student.energy ).to eq(98)
    end

    it "will make you not tired if your energy is less than 30" do
      student = Student.new("Richard", 20, 0)
      student.break
      expect( student.energy ).to eq(35)
    end
  end

  describe "#consume_adderall" do
    it "will increase energy by 50 regardless of current energy level" do
      student = Student.new("Richard", 100, 0)
      student.consume_adderall
      expect( student.energy ).to be(150)
    end
  end
end
