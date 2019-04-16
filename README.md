# coolpoco

[![Python 3.7](https://img.shields.io/badge/python-3.7-red.svg)](https://www.python.org/downloads/release/python-360/)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

めんどぐさがりやの出退勤を世界一スマートにする

https://coolpoco.readthedocs.io/ja/latest/


<img src="http://art22.photozou.jp/pub/172/336172/photo/62817110_624.v1554706871.jpg" width="150">

----



## How to setup for developers.

### fork repository.

* push [fork] button in https://github.com/enterprisegeeks/coolpoco 

### checkout your coolpoco repository and make branch.

```
git clone https://github.com/<your name>/coolpoco.git
cd coolpoco
git checkout -b <branch name should be descriptive>
```

### setup pipenv

```
sudo apt install pipenv
cd $THIS_REPO
pipenv install -d
```

### change python env when you want to use...

```
cd $THIS_REPO
pipenv shell
```

### How to encrypt/decrypt file.

```
# encrypt
ansible-value encrypt file_to_encrypt_you_want
Valut password: xxx

# encrypt
ansible-value encrypt file_to_decrypt_you_want
New Vault password: xxx
Confirm New Vault password:xxx
Encryption successful
```


## How to build sphinx-documents.

```
cd $THIS_REPO/docs
make html
```



