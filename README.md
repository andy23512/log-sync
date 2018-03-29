# django-webpack-pack
A start pack for django with webpack 2

## Requirement
- Python3
- pip
- nodejs
- virtualenv

## Setup

### Create a virtual environment
```
$ virtualenv ~/.virtualenvs/[your-venv-name]/ -p python3
```

### Activate virtual environment
```
$ source ~/.virtualenvs/[you-venv-name]/bin/activate
```

### Install dependencies
```
$ yarn (or npm i)
$ pip install -r requirements.txt
$ pip install --upgrade git+git://github.com/syrusakbary/pyjade.git@d8cf1d9404c759c6a2430c9a900874ab
0e970cd8
```

### Set the port number at which django dev server and socket server will run
```
$ echo [port number] > port
$ echo [socket port number] > socket-port
```

### Migrate database
```
$ ./manage.py migrate
```

## Commands

### webpack watch and build
```
$ yarn start (or npm start)
```

### django server
```
$ yarn run django (or npm run django)
```

### webpack build once and exit
```
$ yarn run build (or npm run build)
```

## Lints

### django-lint
```
$ yarn run lint:djg (or npm run lint:djg)
```

### ls-lint
```
$ yarn run lint:ls (or npm run lint:ls)
```

### pylint
```
$ yarn run lint:py (or npm run lint:py)
```

### stylint
```
$ yarn run lint:styl (or npm run lint:styl)
```
