# Lesson notes

* You want to build a system that allows a user to login and request a prescription for medication. 
* A doctor must review each prescription before it's issued. They can approve or reject the description. 



Tables: 

User
  - id
  - name
  - email
  - password

Doctor
  - id
  - name
  - email
  - password

Prescription
  - id
  - user_id
  - doctor_id
  - medication_id
  - created_at
  - status

Medication
  - id
  - name
  - dosage_in_mg


- How do we get all prescriptions issued to a user? 
- How do we get all unreviewed prescriptions? 
- How do we find out which doctor is prescribing the most viagra? 


## Many-to-many

Instructables. 
* We want to list a bunch of DIY projects
* Which also list what tools are required
* And have some images of the project. 

Project
  - id
  - title
  - instructions

Tools 
  - id
  - name
  - image_url

Projects_tools
  - project_id
  - tool_id

Images
  - id
  - image_url
  - project
