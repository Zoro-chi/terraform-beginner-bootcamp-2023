# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for runy.
It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

#### \*\*\*Notice: Since this project is built locally and not with gitpod, I attached a start script for the server in the package.json

```json
{
	"scripts": {
		"start": "cd ./terratowns_mock_server && bundle exec ruby server.rb"
	}
}
```

#### \*\*\*Notice: Since this project is built locally and not with gitpod, I had to modify the build_provider script in `bin/build_provider`

```sh
PLUGIN_NAME="terraform-provider-terratowns_v1.0.0"
PLUGIN_DIR=".terraform.d/plugins/local.providers/local/terratowns/1.0.0"
PROJECT_ROOT="/Users/zoro/Desktop/JR/Projects/terraform-beginner-bootcamp-2023"

# Move to the project root
cd "$PROJECT_ROOT/terraform-provider-terratowns" || exit 1

# Copy the .terraformrc file
cp "$PROJECT_ROOT/terraformrc" "$PROJECT_ROOT/.terraformrc"

# Remove existing Terraform directories and files
rm -rf "$PROJECT_ROOT/.terraform.d/plugins"
rm -rf "$PROJECT_ROOT/.terraform"
rm -rf "$PROJECT_ROOT/.terraform.lock.hcl"

# Build the Go binary
go build -o "$PLUGIN_NAME" || exit 1

# Create directories in the project root
mkdir -p "$PROJECT_ROOT/$PLUGIN_DIR/x86_64/"
mkdir -p "$PROJECT_ROOT/$PLUGIN_DIR/linux_amd64/"
mkdir -p "$PROJECT_ROOT/$PLUGIN_DIR/darwin_arm64/"

# Copy the binary to the project root directories
cp "$PLUGIN_NAME" "$PROJECT_ROOT/$PLUGIN_DIR/x86_64/"
cp "$PLUGIN_NAME" "$PROJECT_ROOT/$PLUGIN_DIR/linux_amd64/"
cp "$PLUGIN_NAME" "$PROJECT_ROOT/$PLUGIN_DIR/darwin_arm64/"

# Move to the home directory
cd ~ || exit 1

# Create directories in the home directory
mkdir -p ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/x86_64/
mkdir -p ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/linux_amd64/
mkdir -p ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/darwin_arm64/

# Copy the binary to the home directory directories
cp "$PROJECT_ROOT/$PLUGIN_DIR/x86_64/$PLUGIN_NAME" ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/x86_64/
cp "$PROJECT_ROOT/$PLUGIN_DIR/linux_amd64/$PLUGIN_NAME" ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/linux_amd64/
cp "$PROJECT_ROOT/$PLUGIN_DIR/linux_amd64/$PLUGIN_NAME" ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/darwin_arm64/

# Verify that the binary exists in the destination directories
if [ ! -f ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/x86_64/"$PLUGIN_NAME" ]; then
  echo "Error: Binary not found in ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/x86_64/"
  exit 1
fi

if [ ! -f ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/linux_amd64/"$PLUGIN_NAME" ]; then
  echo "Error: Binary not found in ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/linux_amd64/"
  exit 1
fi

if [ ! -f ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/linux_amd64/"$PLUGIN_NAME" ]; then
  echo "Error: Binary not found in ~/.terraform.d/plugins/local.providers/local/terratowns/1.0.0/darwin_arm64/"
  exit 1
fi

echo "Plugin installation successful."

```

## CRUD

Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete
