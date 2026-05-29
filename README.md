# Task Manager API

A RESTful JSON API for managing tasks, built with Ruby on Rails. This project demonstrates core Rails concepts including models, migrations, validations, controllers, routing, and testing.

## Tech Stack

- **Language:** Ruby 3.2.2
- **Framework:** Ruby on Rails 8.1.3
- **Database:** PostgreSQL
- **Testing:** Minitest (Rails default)

## Features

- Create, read, update, and delete tasks
- Data validation (required fields, allowed status values)
- Descriptive error responses for invalid requests
- Full test coverage for models and API endpoints

## Task Fields

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| title | string | Yes | |
| description | text | No | |
| status | string | Yes | Must be `pending`, `in_progress`, or `completed` |
| due_date | date | No | |

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/tasks` | List all tasks |
| POST | `/tasks` | Create a task |
| GET | `/tasks/:id` | Get a single task |
| PATCH | `/tasks/:id` | Update a task |
| DELETE | `/tasks/:id` | Delete a task |

## Getting Started

**Requirements:** Ruby 3.2.2, PostgreSQL

```bash
# Install dependencies
bundle install

# Set up the database
rails db:create db:migrate

# Start the server
rails server
```

## Example Requests

**Create a task**
```bash
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{"task": {"title": "Buy groceries", "status": "pending"}}'
```

**List all tasks**
```bash
curl http://localhost:3000/tasks
```

**Update a task**
```bash
curl -X PATCH http://localhost:3000/tasks/1 \
  -H "Content-Type: application/json" \
  -d '{"task": {"status": "completed"}}'
```

**Delete a task**
```bash
curl -X DELETE http://localhost:3000/tasks/1
```

## Running Tests

```bash
rails test
```
