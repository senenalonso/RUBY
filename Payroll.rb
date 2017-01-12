require 'colorize'

class Payroll
    def initialize(employees)
        @employees = employees
    end

  	def pay_employees
      # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
      total_amount_per_week = @employees.reduce(0) do |sum, employee|
      puts "The salary of #{employee.name} is #{employee.calculate_salary}€ per week"
      notify_employee(employee)
      sum += employee.calculate_salary
      end
  	  puts "The total amount in this week is #{total_amount_per_week}"
  	end

  	private
  	def notify_employee(employee)
        puts "We have sent an email to #{employee.email} notifying a new payroll"
  	end
end

class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        @name = name
        @email = email
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hours_worked * @hourly_rate
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, yearly_rate)
        @name = name
        @email = email
        @yearly_rate = yearly_rate
    end

    def calculate_salary
      @yearly_rate / 52
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, yearly_rate, hourly_rate, hours_worked)
        @name = name
        @email = email
        @yearly_rate = yearly_rate
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      (((@hours_worked-40) * @hourly_rate) + (@yearly_rate / 52))
    end
end

josh = SalariedEmployee.new("Josh", "josh@job.com", 50000)
nizar = SalariedEmployee.new("Nizar", "nizarh@job.com", 150000)
ted = MultiPaymentEmployee.new("Josh", "josh@job.com", 80000, 25, 50)
senen = HourlyEmployee.new("Senén", "senen@job.com", 15, 40)
alonso = HourlyEmployee.new("Alonso", "alonso@job.com", 15, 40)

employees = [josh, nizar, ted, senen, alonso]
payroll = Payroll.new(employees)
payroll.pay_employees