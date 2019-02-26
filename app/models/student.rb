class Student

  @@all = []

  attr_accessor :first_name

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, status, instructor)
    BoatingTest.new(self, test_name, status, instructor)
  end

  def self.find_student(name)
    @@all.find do |student|
      student.first_name == name
    end
  end

  def boating_tests
    BoatingTest.all.select do |test|
      test.student == self
    end
  end

  def passed_tests
    self.boating_tests.select do |test|
      test.status == "passed"
    end
  end

  def grade_percentage
    (self.passed_tests.length.to_f)/(self.boating_tests.length.to_f)
  end

end
