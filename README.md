# "Hitchr" Client - The Creative Otters

## Background

*Hitchr* is a full-stack assignment for the Hack Reactor software engineering immersive program.

This repo contains the *Hitchr* _**node server**_ files for **The Creative Otters**, a team consisting of the following developers:

- Randall Stanford - *Product Manager & Software Engineer*
- Trevor Settles - *Architecture Owner & Software Engineer*
- Sam Pool - *UI Owner & Software Engineer*
- Cade Kreikemeier - *Software Engineer*
- Yunfan Gao - *Software Engineer*

The _**frontend**_ of this fullstack app can be found in a **[different repo](https://github.com/The-Creative-Beavers/hitchr-frontend)**. All details laid out in this repo are in regards to the **node server** specifically.

These five developers were given roughly 1.5 weeks to build out a fullstack web application from scratch according to a rough concept from a mock client.

---

## The Concept

***Hitchr*** is a fullstack web app that allows users to post drives they will be taking (_i.e. a specific starting destination and ending destination_) so that other users can search for rides they wish to take and find posted trips that match their search.

The ultimate goal of _Hitchr_ is to reduce car traffic by allowing users to rideshare for long drives.

---

## Primary Technologies

This project's client app was built using the following primary technologies

- **Express**
    - a minimal and flexible Node.js web application framework
- **Passport**
    - authentication middleware for Node.js
- **Jest & Supertest**
    - Testing frameworks used for unit tests, integration tests, and end-to-end tests.

---

## Installation

Steps for getting started as a developer on this repo:

1. Clone this repo onto your local machine:
    - ```git clone https://github.com/The-Creative-Beavers/hitchr-backend.git```
2. ```cd``` into the repo's root directory
3. Install the project's depencies:
    - ```npm install```
4. Start developing!

---

## Provided Scripts

- ```npm run start```
    - runs the node server in production mode - __does not watch for file changes__.
- ```npm run watch```
    - starts a node server on localhost - by default on ```localhost:5000``` - then __watches for changes and restarts the server with updated content on each file change__.
- ```npm run test```
    - runs the app's full test suite via **Jest**, automatically running all files with a `.test.jsx` or `test.js` file extension.
    - _**NOTE:**_ This repo's GitHub default branch will not merge any updates that cause the included tests to fail.
- ```npm run lint```
    - runs **eslint** on the full repo to check for syntax errors of code-style violations. This repo ueses the **AirBnB Style Guide**
    - _**NOTE:**_ This repo's GitHub default branch will not merge any updates that do not pass the linter.
- ```npm run lint-fix```
    - runs **eslint** on the full repo to check for syntax errors of code-style violations. This repo ueses the **AirBnB Style Guide**
    - _**NOTE:**_ This repo's GitHub default branch will not merge any updates that do not pass the linter.

---

## Project Structure

- ```database/```
    - files related to the creation of a PostgreSQL database.

- ```src/```
  - files related to the API server
    - ```controllers/```
      - STUFF HERE
    - ```db/```
      - STUFF HERE
    - ```dependencies/```
      - STUFF HERE
    - ```routes/```
      - STUFF HERE

---
