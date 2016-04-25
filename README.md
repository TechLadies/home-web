[![Code Climate](https://codeclimate.com/github/TechLadies/home-web/badges/gpa.svg)](https://codeclimate.com/github/TechLadies/home-web)
[![Test Coverage](https://codeclimate.com/github/TechLadies/home-web/badges/coverage.svg)](https://codeclimate.com/github/TechLadies/home-web/coverage)
[![Circle CI](https://circleci.com/gh/TechLadies/home-web.svg?style=svg)](https://circleci.com/gh/TechLadies/home-web)

This repository contains the source code for a case management application, that was built for [HOME](http://www.home.org.sg/). This project was started as part of the [Tech Ladies](http://www.techladies.co/) initiative, to not only teach women to code, but to actually build something of use for a social cause.

This is what the app looks like:

![Case file show page](https://cloud.githubusercontent.com/assets/19878/14795376/ce51dcc4-0b5a-11e6-9d14-cbd91b17defa.png)

The app helps HOME manage their cases, and supports the following features:

* Volunteers can open new case files, and capture biodata of both domestic and non-domestic foreign workers;
* Each case file can have any number of issues, recorded under preset categories;
* Volunteers can record people and organizations, not unlike a customer relationship management (CRM) system;
* People and organization records can be attached to a case file, along with their role in the case file;
* Volunteers can upload documents, record follow-up action;
* Case files are pending, until closed;
* Admins will be invite new users to the system;
* Admins will be able to activate/deactivate users;
* Admins can reassign case files to active users;
* Admins can add/edit categories, as a tree-based structure;
* Admins can access general, and other, reports and export them to CSV; and
* Admins can view an audit log, of all changes that go through the system.

# Getting Started

Clone the project and bundle:

    git clone git@github.com:TechLadies/home-web.git
    cd home-web
    bundle

Copy the sample files, and amend them as you wish:

    cp config/database.yml.sample config/database.yml
    cp .env.sample .env

Create the database, and populate it with seed data:

    rake db:create db:migrate db:seed

Run tests to check if things are set up right:

    rake

# Contributors

The original [Tech Ladies](http://www.techladies.co/) team are made up of [Cornet](https://github.com/nettocornetto), [Jaryl Sim](https://github.com/jaryl), [Kate Lim](https://github.com/katelyp), [Sandy Tseng](https://github.com/SandyTseng).

If you are interested in helping out, do get in touch with [Jolovan](mailto:jolovan.wham@home.org.sg).
