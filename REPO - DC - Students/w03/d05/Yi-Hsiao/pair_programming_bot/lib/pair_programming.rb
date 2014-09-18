require "sinatra"
require "slim"

class PairProgrammingBot < Sinatra::Base
  @@question_path = "/question"                             # path for all the questions the programming bot will ask
  @@advice_path = "/advice"                                 # path for all the advice the programming bot will give
  @@first_step = "#{ @@question_path }/do-you-have-a-test"  # path for first step of the pair programming workflow

  def get_path(settings)
    # builds the url path based on the type of page it is
    # questions go under the @@question_path subdir & advice goes under the @@advice_path subdir

    subdir = case settings[:type]
      when "question" then @@question_path
      when "advice" then @@advice_path
    end

    subdir + settings[:url]
  end

  get "/" do
    redirect @@first_step
  end

  get "#{ @@question_path }/*" do
    case params[:splat].first
    when "do-you-have-a-test"
      @question = "Do you have a test for that?"
      yes_choice = { type: "question", url: "/did-your-test-pass" }
      no_choice = { type: "advice", url: "/write-test" }

    when "did-your-test-pass"
      @question = "Does the test pass?"
      yes_choice = { type: "question", url: "/do-you-need-refactoring" }
      no_choice = { type: "advice", url: "/pass-test" }

    when "do-you-need-refactoring"
      @question = "Need to refactor?"
      yes_choice = { type: "advice", url: "/refactor-code" }
      no_choice = { type: "advice", url: "/add-functionality" }
    end

    @yes_link = get_path(yes_choice)
    @no_link = get_path(no_choice)

    slim :question
  end

  get "#{ @@advice_path }/*" do
    case params[:splat].first
    when "write-test"
      @advice = "Write a test."
      done = { type: "question", url: "/did-your-test-pass" }

    when "pass-test"
      @advice = "Write just enough code for the test to pass."
      done = { type: "question", url: "/do-you-need-refactoring" }

    when "refactor-code"
      @advice = "Refactor the code."
      done = { type: "question", url: "/did-your-test-pass" }

    when "add-functionality"
      @advice = "Select a new feature to implement."
      done = { type: "question", url: "/do-you-have-a-test" }
    end

    @done_link = get_path(done)

    slim :advice
  end
end
