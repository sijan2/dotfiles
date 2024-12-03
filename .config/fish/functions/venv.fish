function venv --description 'Create or activate a Python virtual environment'
    set -l venv_name ".venv"
    set -l venv_found 0
    set -l setup_file ".venv_setup_done"

    set -q argv[1] && set venv_name $argv[1]

    function find_and_activate_venv
        for dir in */bin/activate.fish */Scripts/activate.fish
            if test -f $dir
                set venv_path (dirname (dirname $dir))
                source $dir
                return 0
            end
        end
        return 1
    end

    if test -d $venv_name
        source $venv_name/bin/activate.fish
        set venv_found 1
        set venv_path $venv_name
    else if find_and_activate_venv
        set venv_found 1
    end

    if test $venv_found -eq 0
        python -m venv $venv_name
        source $venv_name/bin/activate.fish
        set venv_path $venv_name
    end

    if not test -f $venv_path/$setup_file
        pip install --upgrade pip setuptools wheel >/dev/null
        touch $venv_path/$setup_file
    end

    # Create or update .gitignore file
    if not test -f .gitignore
        echo -e "# Python
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
.pybuilder/
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# pipenv
Pipfile.lock

# poetry
poetry.lock

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/

# IDEs
.idea/
.vscode/
*.swp
*.swo

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db" > .gitignore
    end

    if not grep -q "^$venv_name/" .gitignore
        echo "$venv_name/" >> .gitignore
    end

    test -f requirements.txt || touch requirements.txt

end