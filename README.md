# CloudWalk Challenge

### This challenge consists of developing the following requested parameters:
__________________________

# Backoffice Analyst Test
## 1. Introduction
This test is intended for candidates applying to backoffice analyst position at CloudWalk. If you get here, we already like you and see you as a good fit for our company. Now, we propose a challenge similar to the ones that we face on a daily basis.

The challenges were created with the objective of helping you build the knowledge base needed to implement the technical assessment in the end, enjoy!

- The first challenge will help you understand better how the payments industry works.
- The second challenge is an analysis of hypothetical data and the calculus of the time it took to approve the merchants.
- The third challenge is to take conclusions based on the data you got from the previous challenge.

## 2. Pre-requisites
- Git
- A development environment
- Any analysis tool for spreadsheet data

## 3. Tasks

### 3.1 - Understand the Industry
- Explain the money flow and the information flow in the acquirer market and the role of the main players.
- Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.
- Explain what KYC (Know Your Customer) is and how it's important to the company and the entire payment industry.

### 3.2 - Get your hands dirty
The Backoffice in Cloudwalk works with the accreditation. Our mission is to approve our merchants (our customers) in the shortest time possible, so our customers can star to use our solution as soon as possible. Our accreditation is based in 4 statuses: pending_purchase (when the customer started to insert their infos in our app but didn't finish, didn't purchase any product), pending_kyc (which is the status right when the customer purchases the card machine), manual_check (which is the status when the merchant has some pendencies in their data) and, finally, approved (when the merchant is allowed to start using our card machine). We also have two side statuses : inactive (when the merchant has a pendency and it will take a while to solve) and blocked (when the merchant represents a big risk to us and we decided not to go on with the partnership).

<a href="https://github.com/maira-martins-esteves24/bkotest/blob/main/clientes.csv">This csv</a> is a hypothetical table from our database, called clientes, with ficticional clients. <a href="https://github.com/maira-martins-esteves24/bkotest/blob/main/status.csv">This other csv</a> csv is another hypothetical table from our database, called status, with all the different statuses that the merchants from the table clientes have been in. The relation from table clientes to table status is 1 to many. Notice that you can connect the two tables through the user_id (it is the foreighn key).

Your main goal here is to create a query in SQL that shows us all the CNPJs, the dates of purchase and how long it took us to approve each merchant (in hours and in minutes). You can calculate that by the difference the statusses pending_kyc (when the merchant purchased out product) and approved . After that, you are supposed to calculate the average time of approval, and the maximum and minimum time of approval. For that, you will create three queries.

Was there any negative number? If so, why do you think that happened?

## 4. Deliverables

You are expected to submit a compacted git repository with your answers and your project.

We hope you have fun, learn and challenge yourself during this task :)
__________________________

# Development environment:
For the execution of this challenge were used:
- Linux Ubunu 20.04.4 LTS
- MySQL Workbench 8.0.26 build 972499 CE (64 bits)
- Visual Studio Code v. 1.64.2
- Extension MySQL (Link to Marketplace on VS: https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2)
__________________________
# How to access files?
Open your terminal. Enter the following commands in the desired directory:
- git clone git@github.com:brunoarduarte/CloudWalk_Challenge.git
- Using the workbench <img heigth=20px width=20px src="https://cdn.icon-icons.com/icons2/1381/PNG/512/mysqlworkbench_93532.png" title="Mysql, workbench Icon Free">
Create a schema. Then, when expanding this newly created schema, right-click on tables and select Table Data Import Wizard. Look for the files (`clientes.csv` and `status.csv`) that were cloned inside the 
bkotest-main folder in the project root.
- Open your VS Code, install and configure the MySQL extension (https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2)
- Open the queries.sql file inside the Get_your_hands_dirty folder. 
Initially run the first three queries to create the VIEWS (`vw_relatorio_data_compra`, `vw_relatorio_data_aprovacao` and `vw_relatorio_completo`).
- With the VIEWS properly processed, the other queries can be executed to obtain, in this order, the average of approval times, maximum time and minimum time.
