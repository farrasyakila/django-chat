# Use the official Python image from Docker Hub as the base image
FROM python:3.10.12-alpine3.18

# Create workding directory
RUN mkdir -p /app

# Set the working directory in the container
WORKDIR /app

# Copy datasource from local
COPY . .

# Install Dependency
RUN pip install -r requirements.txt

# Migrate database
RUN python manage.py makemigrations
RUN python manage.py migrate

# expose port
EXPOSE 8000

# Run application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
