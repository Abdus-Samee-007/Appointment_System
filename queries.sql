CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(50),
    Description VARCHAR(255),
    DurationMinutes INT
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    ClientID INT,
    ServiceID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

INSERT INTO Clients (ClientID, Name, Email, Phone)
VALUES 
    (1, 'John Doe', 'johndoe@email.com', '123-456-7890'),
    (2, 'Jane Smith', 'janesmith@email.com', '987-654-3210'),
    (3, 'Alice Johnson', 'alicejohnson@email.com', '555-123-4567'),
    (4, 'Bob Miller', 'bobmiller@email.com', '789-012-3456'),
    (5, 'Emily Davis', 'emilydavis@email.com', '234-567-8901');

select * from Clients;



-- Inserting data into Services table
INSERT INTO Services (ServiceID, ServiceName, Description, DurationMinutes)
VALUES 
    (1, 'Haircut', 'Standard haircut', 30),
    (2, 'Massage', '60-minute relaxation massage', 60),
    (3, 'Manicure', 'Basic manicure', 45),
    (4, 'Pedicure','Basic Pedicure',50),
    (5,'Hair colouring','Colouring of hair',60);

select * from Services;
-- Inserting data into Appointments table
INSERT INTO Appointments (AppointmentID, ClientID, ServiceID, AppointmentDate, AppointmentTime)
VALUES 
    (101, 1, 1, '2024-01-10', '10:00:00'),
    (102, 2, 3, '2024-01-12', '14:30:00'),
    (103, 1, 2, '2024-01-15', '12:00:00'),
    (104, 3,5,'2024-01-22','13:00:00'),
    (105,3,4,'2024-02-01','17:30:00');

-- Querying appointments for a specific client
SELECT 
    Appointments.AppointmentID, Clients.Name AS ClientName, Services.ServiceName, Appointments.AppointmentDate, Appointments.AppointmentTime
FROM 
    Appointments
JOIN 
    Clients ON Appointments.ClientID = Clients.ClientID
JOIN 
    Services ON Appointments.ServiceID = Services.ServiceID
WHERE 
    Clients.ClientID = 1;
    
    
    SELECT Clients.ClientID, Clients.Name FROM Clients
LEFT JOIN Appointments ON Clients.ClientID = Appointments.ClientID
WHERE Appointments.AppointmentID IS NULL;