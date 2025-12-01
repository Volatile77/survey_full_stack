# Use the official Python 3.10 image
FROM python:3.10

# Set the working directory to /code
WORKDIR /code

# Copy the requirements file
COPY ./requirements.txt /code/requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the rest of the application code
COPY . /code

# Create a writable directory for uploads/logs if needed (HF Spaces runs as non-root user 1000 usually, but Docker spaces are flexible)
# We'll ensure permissions are fine.
RUN mkdir -p /code/uploads && chmod 777 /code/uploads

# Expose port 7860 (Hugging Face default)
EXPOSE 7860

# Command to run the application
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "7860"]
