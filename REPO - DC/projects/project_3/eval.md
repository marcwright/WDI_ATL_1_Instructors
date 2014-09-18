## WDI Project Evaluations

Below is a general breakdown of what we're looking for from your WDI projects. We've placed an emphasis on development process, code quality, and implementation deliverables.

Each subject will be graded on a 1 to 5 point system, which is outlined in plain english below.

__Note:__ The expectation is not that you'll produce a killer, world-beating app on the first go-around. Instead, we're looking for progress. A healthy goal would be to hit 3s across the board on the first project, and 4s and 5s by the final project. 

___
### Development Process

- __Requirements Gathering & Specification__ 
    1. Does not write user stories and/or draft wireframes.
    2. Verbally articulates user stories, but produces no written documentation. Interface wireframes are incomplete or missing.
    3. Stories have a role, goal, and reason, though may lack details. Wireframes capture few specifics about application workflows.
    4. Written user stories demonstrate a thoughtful understanding of the target audience. Wireframes comprehensively illustrate user workflows.
    5. User stories demonstrate extensive audience research. High-fidelity wireframes define detailed workflows.
- __Application Architecture__
    1. No ERD
    2. Entity relationships are ill-defined, and/or fail to separate concerns.
    3. An ERD defines content types and their relationships.
    4. An ERD defines content types and their relationships. Properly separates front-end and back-end concerns.
    5. Follows industry standards learned through documentation. Architectural considerations clearly exceed core curriculum.
- __Tested__
    1. No tests
    2. Tests are incomplete, and/or missing for major software components. Low test coverage.
    3. Unit and acceptance tests written for all software components, but may not adequately validate component behaviors.
    4. All software components are validated by unit and acceptance tests. Tests are succinct and thoroughly validate software requirements.
    5. Testing leverages tools outside of core curriculum.
- __Documentation__
    1. No README content.
    2. README introduces the project, but is missing key elements.
    3. Github Repo includes a link to the live site. README defines the software's purpose, technology used, ERD and user stories.
    4. "
    5. README is cleanly formatted and follows documentation conventions found in related software projects.
- __Deployment__
    1. Not deployed
    2. "
    3. Project on Heroku
    4. "
    5. Project is hosted somewhere besides Heroku

###Code Quality

- __Well-formatted, clean project__
    1. Code becomes unreadable due to highly inconsistant indentation and line breaks.
    2. Code is difficult to read due to unconventional intention and line breaks. Many unused or commented out bits of code. Github Repo has excess unrelated files.
    3. Code generally follows whitespace conventions, but still includes some "messy" areas that should be cleaned up.
    4. Code consistently follows language and framework whitespace conventions. Code is highly readable and consistently formatted.
    5. Code is meticulously formatted to match the domain-specific language of each tool used.

- __DRY__
    1. Key values and methodologies are frequently repeated throughout the codebase. Helper methods are not utilized.
    2. Makes effort to reuse key values and common functions, but has room for improvement.
    3. Helper methods are utilized, and effort is made to refactor code.
    4. Redundancy is eliminated through shared helper methods, partials. 
    5. Knowledge as well as code is not repeated
- __Expresses Intent / Naming__
    1. Class, variable, and method names do not follow language conventions.
    2. Names generally follow language conventions, but otherwise use vague or misleading terminology.
    3. Names follow language conventions and are generally succinct about what they refer to, or what their purpose is. Cryptic shorthand phrases are avoided.
    4. Names follow language, framework, and domain-specific conventions. Naming obviates what methods and objects do, and what variables refer to.
    5. Naming schemes affect a consistent tone and voice. Names serve to narrate the codebase.
- __Small__
    1. Large methods or classes take on too much responsibility.
    2. Helper methods are well-organized, but tend to take on too much responsibility.
    3. Successfully utilizes helper methods to keep controllers slim.
    4. Framework features are leveraged wherever possible. Any vestigial code is removed.
    5. Approriate level of abstraction used for classes and methods to maximize readability. All vestigial code is removed.

###Implementation Deliverables

- __Validation__
    1. No validation
    2. Incomplete validation on either the SQL or ActiveRecord level.
    3. Models fully validated both on the SQL and ActiveRecord level
    4. Validation on both the front and back end
    5. Writes complex custom validations
- __Content Structure (Document Outline)__
    1. Document structure is driven by styling needs instead of content
    2. Thought is put into document structure, but some tags are misused or out of hierarchy flow
    3. Clear document outline demonstrates hierarchy of information
    4. "
    5. Clear document outline demonstrates hierarchy of information for extremely content rich pages
- __New Technology__
    1. No new technology utilized
    2. Attempted to use new technology with limited success
    3. Utilitzes a new JSON API or simple gem
    4. Incorporates a conceptually new technology not covered in class
    5. Built using a completely new language or framework