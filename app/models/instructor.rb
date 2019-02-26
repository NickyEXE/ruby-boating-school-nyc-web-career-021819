class Instructor

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def find_test(student, test_name)
    BoatingTest.all.find do |boating_test|
      boating_test.student == student && boating_test.test_name == test_name
    end
  end

  def pass_student(student, test_name)
    test= find_test(student, test_name)
    if test == nil
      BoatingTest.new(student, test_name, "passed", self)
    else
      test.status = "passed"
      test
    end
  end

  def fail_student(student, test_name)
    test= find_test(student, test_name)
    if test == nil
      BoatingTest.new(student, test_name, "failed", self)
    else
      test.status = "failed"
      test
    end
  end

end
