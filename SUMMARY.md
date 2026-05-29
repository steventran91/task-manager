# Project Build Summary

## What We Built

A JSON REST API for managing tasks using Ruby on Rails and PostgreSQL, built from scratch as a learning project.

## What Was Covered

### 1. Database Setup
- Rails stores database configuration in `config/database.yml`
- Rails automatically names databases based on the app name and environment (`task_manager_development`, `task_manager_test`)
- `rails db:create` creates the empty databases in PostgreSQL

### 2. Model and Migration
- `rails generate model Task title:string description:text due_date:date status:string` generated two files:
  - `app/models/task.rb` — the Ruby class Rails uses to interact with the database
  - `db/migrate/..._create_tasks.rb` — instructions for creating the `tasks` table
- `rails db:migrate` ran the migration and created the table
- Rails automatically adds `id`, `created_at`, and `updated_at` columns

### 3. Validations
- Validations live in the model and run before saving to the database
- `validates :title, presence: true` — title is required
- `validates :status, presence: true` — status is required
- `validates :status, inclusion: { in: [...] }, allow_blank: true` — status must be one of the allowed values
- `allow_blank: true` prevents duplicate error messages when the field is empty

### 4. Routes
- `resources :tasks` in `config/routes.rb` generates all 5 REST endpoints in one line
- `rails routes` shows every route, the HTTP verb, URL pattern, and which controller action handles it

### 5. Controller
- Controllers live in `app/controllers/` and inherit from `ApplicationController`
- Each action receives a request, interacts with the model, and renders a JSON response
- Strong parameters (`task_params`) whitelist which fields clients are allowed to send
- `Task.find(params[:id])` looks up a record by ID from the URL
- `rescue ActiveRecord::RecordNotFound` handles missing records with a 404 response
- HTTP status codes used: `201 Created`, `200 OK`, `204 No Content`, `422 Unprocessable Entity`, `404 Not Found`

### 6. Testing
- Model tests verify validations using `assert` and `assert_not`
- Controller tests send real HTTP requests using `get`, `post`, `patch`, `delete` and assert the response status
- Tests run against a separate `task_manager_test` database

## The Full Request Lifecycle

```
HTTP request → routes → controller → model → database → JSON response
```

## Key Rails Concepts Learned

- **Convention over configuration** — Rails uses naming conventions so you write less boilerplate
- **ActiveRecord** — the layer that maps Ruby objects to database rows
- **MVC pattern** — Model handles data, Controller coordinates, View (JSON in our case) is the response
- **Migrations** — version-controlled changes to the database schema
- **Strong parameters** — security feature that prevents mass assignment vulnerabilities
