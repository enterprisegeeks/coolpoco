# coolpoco

めんどぐさがりやの出退勤を世界一スマートにする

<img src="http://art22.photozou.jp/pub/172/336172/photo/62817110_624.v1554706871.jpg" width="150">

----



## How to setup for developers.

### fork repository.

* push [fork] button in https://github.com/enterprisegeeks/coolpoco 

### checkout your coolpoco repository and make branch.

```
git clone https://github.com/<your name/coolpoco.git
cd coolpoco
git checkout -b <branch name should be descriptive>
```

### setup python env when you want to use..

```
sudo apt install pipenv
cd $THIS_REPO
pipenv shell
```


## How to build sphinx-documents.

```
cd $THIS_REPO/docs
make html
```



