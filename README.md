Library App 📚
A simple library management system built with Ruby on Rails. This app allows users to manage books, track borrowing history, and handle returns.
Setup Instructions 🚀

Prerequisites
Ensure you have the following installed:
Ruby (Recommended: 3.3.7)
Rails (Recommended: 8.0.1
PostgreSQL (or SQLite for development)
Git

1. Clone the Repository
git clone https://github.com/Obunde/library_app.git  
cd library_app  

2. Install Dependencies
bundle install  

3. Set Up the Database
bin/rails db:create  
bin/rails db:migrate  

4. Run the Server
bin/rails server  
Then visit http://localhost:3000 in your browser.

Running Tests 🧪
Model & Controller Tests
To run tests, execute:
bin/rails test  

If you encounter pending migrations, run:
bin/rails db:migrate RAILS_ENV=test  
Then re-run the test command.

Project Structure 📂
app/models/ → Defines data models (Books, Borrowers, BorrowingRecords).
app/controllers/ → Handles requests and business logic.
app/views/ → Contains HTML templates for the front end.
test/ → Contains automated tests for models and controllers.

Contributing 🤝
Fork the repo & create a feature branch (git checkout -b feature-name).
Make changes and commit (git commit -m "Add feature description").
Push to GitHub (git push origin feature-name).
Open a pull request.

Author 👤
Eugene Obunde
For any issues, feel free to open an issue.
Happy coding! 🚀
