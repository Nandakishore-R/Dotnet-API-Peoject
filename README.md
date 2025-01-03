

# Student Portal API Documentation

This project contains a simple Web API built using ASP.NET Core Web API. The API provides endpoints to manage student records, including retrieving, creating, updating, and deleting students.

## Base URL

The base URL for accessing the API is:

```
https://demos.sreekeshkprabhu.me/nandu/api/students
```

## Endpoints

### 1. **Get All Students**
- **Description**: Retrieves a list of all students.
- **Endpoint**: `GET /api/students`
- **Response**:
  - **200 OK**
    ```json
    [
      {
        "id": 1,
        "name": "John Doe",
        "email": "johndoe@example.com",
        "phoneNumber": "1234567890"
      },
      {
        "id": 2,
        "name": "Jane Smith",
        "email": "janesmith@example.com",
        "phoneNumber": "0987654321"
      }
    ]
    ```

### 2. **Get Student by ID**
- **Description**: Retrieves a specific student by their ID.
- **Endpoint**: `GET /api/students/{id}`
- **Path Parameter**:
  - `id` (integer): The unique identifier of the student.
- **Response**:
  - **200 OK**
    ```json
    {
      "id": 1,
      "name": "John Doe",
      "email": "johndoe@example.com",
      "phoneNumber": "1234567890"
    }
    ```
  - **404 Not Found**
    ```json
    {
      "error": "Student not found"
    }
    ```

### 3. **Create a New Student**
- **Description**: Creates a new student record.
- **Endpoint**: `POST /api/students`
- **Request Body**:
  ```json
  {
    "name": "Michael Brown",
    "email": "michaelbrown@example.com",
    "phoneNumber": "1122334455"
  }
  ```
- **Response**:
  - **201 Created**
    ```json
    {
      "id": 3,
      "name": "Michael Brown",
      "email": "michaelbrown@example.com",
      "phoneNumber": "1122334455"
    }
    ```

### 4. **Update an Existing Student**
- **Description**: Updates the details of an existing student.
- **Endpoint**: `PUT /api/students/{id}`
- **Path Parameter**:
  - `id` (integer): The unique identifier of the student.
- **Request Body**:
  ```json
  {
    "name": "Michael B.",
    "email": "michaelb@example.com",
    "phoneNumber": "1222333444"
  }
  ```
- **Response**:
  - **204 No Content** (successful update)
  - **404 Not Found**
    ```json
    {
      "error": "Student not found"
    }
    ```

### 5. **Delete a Student**
- **Description**: Deletes a student by their ID.
- **Endpoint**: `DELETE /api/students/{id}`
- **Path Parameter**:
  - `id` (integer): The unique identifier of the student.
- **Response**:
  - **204 No Content** (successful deletion)
  - **404 Not Found**
    ```json
    {
      "error": "Student not found"
    }
    ```

### 6. **Get Student by Email**
- **Description**: Retrieves a specific student by their email address.
- **Endpoint**: `GET /api/students/email/{email}`
- **Path Parameter**:
  - `email` (string): The email address of the student.
- **Response**:
  - **200 OK**
    ```json
    {
      "id": 1,
      "name": "John Doe",
      "email": "johndoe@example.com",
      "phoneNumber": "1234567890"
    }
    ```
  - **404 Not Found**
    ```json
    {
      "error": "Student not found"
    }
    ```

## Validation Rules

### 1. **Phone Number**:
- The phone number must:
  - Be exactly 10 digits long.
  - Contain only numeric characters (no letters, spaces, or symbols).

### 2. **Email**:
- The email address must be in a valid format (e.g., `example@domain.com`).

