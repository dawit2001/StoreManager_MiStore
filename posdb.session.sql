
CREATE TABLE Stores (
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    Name VARCHAR(200) ,
    Address TEXT NOT NULL,
    ContactPerson VARCHAR(100),
    MobileNumber TEXT
);


CREATE TABLE Products (
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    Name VARCHAR(200) ,
    CatagoryId VARCHAR(36) ,
    Description TEXT, 
    Quantity INT,
    PurchasePrice DECIMAL (60,30) NOT NULL,
    SalesPrice DECIMAL (60,30) NOT NULL,
    Priority VARCHAR (50),
    Size DECIMAL (10,5),
    Color VARCHAR(50),
    SafetyStock INT ,
    StoreId VARCHAR(36),
    AddedBy VARCHAR (36),
    AddedDate DATE
);

CREATE TABLE ProductCatagory(
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    Name VARCHAR(200),
    Description TEXT
);


CREATE TABLE Sales(
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    ProductId VARCHAR(36),
    Quantity INT,
    SaleDate DATE,
    SalerId VARCHAR(36)
);

CREATE TABLE ExpenseCatagory (
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    Name VARCHAR(200),
    Description TEXT

); 
CREATE TABLE Expenses(
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    ExpenseCatagory VARCHAR(36) ,
    Amount DECIMAL(30,20),
    Description TEXT,
    ExpenseDate DATE,
    ExpenseBy VARCHAR(36)
); 
CREATE TABLE Users (
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    FullName VARCHAR(200),
    Username VARCHAR(100) NOT NULL,
    password VARCHAR(40)   NOT NULL,
    email VARCHAR(255) NOT NULL,
    phoneNo TEXT,
    Role VARCHAR(100) NOT NULL
);
CREATE TABLE Message (
    Id VARCHAR(36) PRIMARY KEY NOT NULL,
    subject TEXT,
    Message TEXT,
    sendBy VARCHAR(36) ,
    recievedBy VARCHAR(36),
    messageDate DATE
);

-- adding foriegn keys---

-- for Store table--

ALTER TABLE Stores MODIFY  ContactPerson VARCHAR(36);
ALTER TABLE Stores ADD CONSTRAINT fk_store_contact_person FOREIGN KEY (ContactPerson) REFERENCES Users(Id);

-- for Products table

ALTER TABLE Products ADD CONSTRAINT fk_product_category FOREIGN KEY (CatagoryId) REFERENCES ProductCatagory(Id);

ALTER TABLE Products ADD CONSTRAINT fk_product_adder FOREIGN KEY (AddedBy) REFERENCES Users(Id);

ALTER TABLE Products ADD CONSTRAINT fk_product_store FOREIGN KEY (StoreId) REFERENCES Stores(Id);


ALTER TABLE Sales ADD CONSTRAINT fk_sold_product FOREIGN KEY (ProductId) REFERENCES Products(Id);


ALTER TABLE Sales ADD CONSTRAINT fk_saler FOREIGN KEY (SalerId) REFERENCES Users(Id);



-- for Expense Table

ALTER TABLE Expenses ADD CONSTRAINT fk_expense_category FOREIGN KEY (ExpenseCatagory) REFERENCES ExpenseCatagory(Id);


ALTER TABLE Expenses ADD CONSTRAINT fl_expender FOREIGN KEY (ExpenseBy) REFERENCES Users(Id);


-- for Expense Table

ALTER TABLE Message ADD CONSTRAINT fk_sender FOREIGN KEY (sendBy) REFERENCES Users(Id);



ALTER TABLE Message ADD CONSTRAINT fk_reciever FOREIGN KEY (recievedBy) REFERENCES Users(Id);