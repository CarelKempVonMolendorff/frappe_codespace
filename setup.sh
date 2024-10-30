#!/bin/bash

# Set environment variables
export FRAPPE_APP_NAME="frappe"
export ERP_NEXT_APP_NAME="erpnext"
export CUSTOM_REPO_URL="https://github.com/Altrix-One/erpnext"  # Update this with your custom repo
export FRAPPE_UI_URL="https://github.com/Altrix-One/frappe-ui"
export HRMS_URL="https://github.com/Altrix-One/hrms"

# Create a new bench instance
bench init frappe-bench --frappe-branch version-15  # Adjust the version as needed
cd frappe-bench

# Get the latest version of Frappe and ERPNext
bench get-app $FRAPPE_APP_NAME
bench get-app $ERP_NEXT_APP_NAME $CUSTOM_REPO_URL --branch develop
bench get-app $FRAPPE_UI_URL
bench get-app $HRMS_URL --branch develop

# Install the ERPNext app
bench new-site site1.local --admin-password admin --install-app erpnext
bench --site site1.local --install-app frappe_ui
bench --site site1.local --install-app hrms

# Install other dependencies
bench setup requirements
bench setup nginx
